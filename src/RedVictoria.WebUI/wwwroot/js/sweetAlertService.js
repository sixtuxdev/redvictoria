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
    }
};
