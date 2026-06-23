// Service worker de produccion para RedVictoria.WebUI.
// Mantiene soporte PWA, pero prioriza la red para evitar que celulares queden
// atrapados con index.html o archivos principales de una version anterior.

self.importScripts('./service-worker-assets.js');

const cacheNamePrefix = 'redvictoria-cache-';
const legacyCacheNamePrefixes = ['offline-cache-'];
const appVersion = 'v1.0.1';
const cacheName = `${cacheNamePrefix}${appVersion}-${self.assetsManifest.version}`;

const offlineAssetsInclude = [
    /\.dll$/,
    /\.pdb$/,
    /\.wasm$/,
    /\.json$/,
    /\.css$/,
    /\.js$/,
    /\.woff$/,
    /\.png$/,
    /\.jpe?g$/,
    /\.gif$/,
    /\.ico$/,
    /\.blat$/,
    /\.dat$/
];

const offlineAssetsExclude = [
    /^index\.html$/,
    /^service-worker\.js$/,
    /^service-worker-assets\.js$/,
    /^manifest\.webmanifest$/
];


self.addEventListener('install', event => {
    self.skipWaiting();
    event.waitUntil(onInstall());
});

self.addEventListener('activate', event => {
    event.waitUntil(onActivate());
});

self.addEventListener('fetch', event => {
    if (event.request.method !== 'GET') {
        return;
    }

    event.respondWith(onFetch(event));
});

async function onInstall() {
    console.info('Service worker: Install', cacheName);

    const assetsRequests = self.assetsManifest.assets
        .filter(asset => offlineAssetsInclude.some(pattern => pattern.test(asset.url)))
        .filter(asset => !offlineAssetsExclude.some(pattern => pattern.test(asset.url)))
        .map(asset => new Request(asset.url, { integrity: asset.hash, cache: 'no-cache' }));

    const cache = await caches.open(cacheName);
    await cache.addAll(assetsRequests);
}

async function onActivate() {
    console.info('Service worker: Activate', cacheName);

    const cacheNames = await caches.keys();
    await Promise.all(
        cacheNames
            .filter(name => (name.startsWith(cacheNamePrefix) && name !== cacheName)
                || legacyCacheNamePrefixes.some(prefix => name.startsWith(prefix)))
            .map(name => caches.delete(name))
    );

    await self.clients.claim();
}

async function onFetch(event) {
    const requestUrl = new URL(event.request.url);

    if (shouldUseNetworkFirst(event.request, requestUrl)) {
        return networkFirst(event.request);
    }

    const cache = await caches.open(cacheName);
    const cachedResponse = await cache.match(event.request);

    if (cachedResponse) {
        return cachedResponse;
    }

    return fetch(event.request);
}

function shouldUseNetworkFirst(request, requestUrl) {
    if (request.mode === 'navigate') {
        return true;
    }

    const pathname = requestUrl.pathname.toLowerCase();

    return pathname.endsWith('/index.html')
        || pathname.endsWith('/service-worker.js')
        || pathname.endsWith('/service-worker-assets.js')
        || pathname.endsWith('/manifest.webmanifest')
        || pathname.endsWith('/_framework/blazor.boot.json')
        || pathname.endsWith('/css/app.css')
        || pathname.endsWith('/js/site.js')
        || pathname.endsWith('/js/sweetalertservice.js')
        || pathname.endsWith('/redvictoria.webui.styles.css');
}

async function networkFirst(request) {
    const cache = await caches.open(cacheName);
    const requestUrl = new URL(request.url);
    const fallbackRequest = request.mode === 'navigate' ? 'index.html' : request;

    try {
        const networkRequest = request.mode === 'navigate'
            ? new Request(request.url, { cache: 'no-store', credentials: request.credentials })
            : new Request(request, { cache: 'no-store' });

        const networkResponse = await fetch(networkRequest);

        if (networkResponse && networkResponse.ok && requestUrl.origin === self.location.origin) {
            await cache.put(fallbackRequest, networkResponse.clone());
        }

        return networkResponse;
    } catch (error) {
        const cachedResponse = await cache.match(fallbackRequest);
        if (cachedResponse) {
            return cachedResponse;
        }

        throw error;
    }
}