window.RedVictoriaSweetAlert = {
    fire: (icon, title, text) => {
        if (window.Swal) {
            return window.Swal.fire({
                icon,
                title,
                text,
                confirmButtonText: "Aceptar"
            });
        }

        window.alert(text || title);
        return Promise.resolve();
    },
    fireReferralLink: (url) => {
        const message = "Tu registro fue creado correctamente. Copia y comparte este enlace para que otras personas puedan registrarse bajo tu referido.";

        if (!window.Swal) {
            window.alert(`${message}\n\n${url}`);
            return navigator.clipboard?.writeText(url) || Promise.resolve();
        }

        return window.Swal.fire({
            icon: "success",
            title: "Registro exitoso",
            html: `
                <div style="text-align:left">
                    <p style="margin:0 0 14px">${message}</p>
                    <div style="
                        background:#f5f7fb;
                        border:1px solid #d7dce8;
                        border-radius:8px;
                        padding:12px;
                        color:#1f2937;
                        font-size:14px;
                        line-height:1.45;
                        word-break:break-all;
                        user-select:all;">
                        ${escapeHtml(url)}
                    </div>
                </div>`,
            showCancelButton: true,
            confirmButtonText: "Copiar enlace",
            cancelButtonText: "Cerrar",
            reverseButtons: true,
            preConfirm: async () => {
                try {
                    await navigator.clipboard.writeText(url);
                    return true;
                } catch {
                    window.Swal.showValidationMessage("No fue posible copiar el enlace automaticamente.");
                    return false;
                }
            }
        }).then((result) => {
            if (result.isConfirmed) {
                return window.Swal.fire({
                    icon: "success",
                    title: "Enlace copiado",
                    text: "El enlace fue copiado correctamente.",
                    confirmButtonText: "Aceptar"
                });
            }
        });
    },
    confirmDeactivate: async (name) => {
        if (!window.Swal) {
            return window.confirm(`Deseas desactivar a ${name}?`);
        }

        const result = await window.Swal.fire({
            icon: "warning",
            title: "Desactivar referido",
            text: `Deseas desactivar a ${name}? Esta accion no elimina el registro, solo lo marca como inactivo.`,
            showCancelButton: true,
            confirmButtonText: "Desactivar",
            cancelButtonText: "Cancelar",
            reverseButtons: true,
            confirmButtonColor: "#E11D48"
        });

        return result.isConfirmed === true;
    },
    copyText: async (text) => {
        await navigator.clipboard.writeText(text);

        if (window.Swal) {
            await window.Swal.fire({
                icon: "success",
                title: "Enlace copiado",
                text: "El enlace fue copiado correctamente.",
                timer: 1700,
                showConfirmButton: false
            });
        }
    }
};

function escapeHtml(value) {
    return String(value)
        .replaceAll("&", "&amp;")
        .replaceAll("<", "&lt;")
        .replaceAll(">", "&gt;")
        .replaceAll('"', "&quot;")
        .replaceAll("'", "&#039;");
}
