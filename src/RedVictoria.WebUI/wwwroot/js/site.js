window.redVictoria = window.redVictoria || {};

window.redVictoria.copyToClipboard = async function (text) {
    try {
        if (navigator.clipboard && window.isSecureContext) {
            await navigator.clipboard.writeText(text);
            return true;
        }

        const textArea = document.createElement("textarea");
        textArea.value = text;
        textArea.style.position = "fixed";
        textArea.style.left = "-999999px";
        textArea.style.top = "-999999px";
        textArea.setAttribute("readonly", "");

        document.body.appendChild(textArea);

        if (/ipad|iphone/i.test(navigator.userAgent)) {
            const range = document.createRange();
            range.selectNodeContents(textArea);

            const selection = window.getSelection();
            selection.removeAllRanges();
            selection.addRange(range);

            textArea.setSelectionRange(0, text.length);
        } else {
            textArea.select();
        }

        const successful = document.execCommand("copy");
        document.body.removeChild(textArea);

        return successful;
    } catch (error) {
        console.error("Error copiando al portapapeles:", error);
        return false;
    }
};