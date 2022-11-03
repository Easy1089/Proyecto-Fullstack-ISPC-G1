
const usuario = document.getElementById("usuario");    //Guardo la info del campo para luego procesarla
const password = document.getElementById("password");
const password2 = document.getElementById("re_password");
const nombre = document.getElementById("nombre");
const apellido = document.getElementById("apellido");
const email = document.getElementById("email");
const telefono = document.getElementById("telefono");

const form = document.getElementById("form");
const parrafo = document.getElementById("warnings");
const inputs = document.querySelectorAll('#form input');


const expresiones = 
{
	usuario: /^[a-zA-Z0-9\_\-]{4,16}$/, // Letras, numeros, guion y guion_bajo
	nombre: /^[a-zA-ZÀ-ÿ\s]{3,40}$/,    // Letras y espacios, pueden llevar acentos.
    apellido: /^[a-zA-ZÀ-ÿ\s]{3,40}$/,  // Letras y espacios, pueden llevar acentos.
	password: /^.{4,16}$/,              // 4 a 12 digitos.
	correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
	telefono: /^\d{7,14}$/              // 7 a 14 numeros.
}

const campos = 
{
	usuario: false,
	nombre: false,
	password: false,
	correo: false,
	telefono: false
}

const validarFormulario = (e) =>
    {
        switch (e.target.name)
        {
            case "usuario":
                validarCampo(expresiones.usuario, e.target, "usuario");
            break;

            case "password":
                validarCampo(expresiones.password, e.target, "password");
            break;

            case "re_password":
                validarPassword2();
            break;

            case "nombre":
                validarCampo(expresiones.nombre, e.target, "nombre");
            break;

            case "apellido":
                validarCampo(expresiones.apellido, e.target, "apellido");
            break;

            case "email":
                validarCampo(expresiones.correo, e.target, "email");
            break;

            case "telefono":
                validarCampo(expresiones.telefono, e.target, "telefono");
            break;

        }
    }

const validarCampo = (expresion, input, campo) =>
{
    let warnings = "";
    parrafo.innerHTML = ""
        
    if(expresion.test(input.value))
    {
        campos[campo] = true;
    }
    
    else
    {
        warnings += `<p class="alertajs"> El ${campo} no es valido</p> `;  
        parrafo.innerHTML = warnings;
        campos[campo] = false;
    }
}

const validarPassword2 = () =>
{
    let warnings = "";
    parrafo.innerHTML = ""

    const inputPasword1 = document.getElementById('password');
    const inputPasword2 = document.getElementById('re_password');

    if (inputPasword1.value !== inputPasword2.value)
    {
        warnings += `<p class="alertajs"> La contraseña no son iguales</p> `;  
        parrafo.innerHTML = warnings;
        campos['password'] = false;
    }
    else
    {
        campos['password'] = true;
    }
}

inputs.forEach((input) => 
{  
    input.addEventListener('blur',validarFormulario);
});

//Validaciones la momento del apretar el boton
form.addEventListener("submit", e =>    
{
    e.preventDefault(); 
    switch (e.target.name)
        {
            case "formLogin":
                if(campos.usuario && campos.password )
                {
                    form.reset();
                    parrafo.innerHTML = `<p class="correctjs"> Formulario cargado correctamente </p>`;
                }
                else
                {
                    parrafo.innerHTML = `<p class="alertajs"> Verificar los campos cargados en el formulario </p>`;
                }
            break;

            case "formRecuperar":
                if(campos.email)
                {
                    form.reset();
                    parrafo.innerHTML = `<p class="correctjs"> Formulario cargado correctamente </p>`;
                }
                else
                {
                    parrafo.innerHTML = `<p class="alertajs"> Verificar los campos cargados en el formulario </p>`;
                }
            break;

            case "formRegister":
                const terminos = document.getElementById('terminos');
                if(campos.usuario && campos.password && campos.nombre && campos.apellido && campos.email && campos.telefono && terminos.checked)
                {
                    form.reset();
                    parrafo.innerHTML = `<p class="correctjs"> Formulario cargado correctamente </p>`;
                }
                else
                {
                    parrafo.innerHTML = `<p class="alertajs"> Verificar los campos cargados en el formulario </p>`;
                }
            break;
        }
})