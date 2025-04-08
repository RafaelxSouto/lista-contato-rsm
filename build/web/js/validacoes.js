/**
 * Realiza a validação completa do formulário de contato
 * 
 * Esta função verifica:
 * - Se o endereço foi preenchido
 * - Se a cidade contém apenas letras e espaços
 * - Se o DDD possui exatamente 2 dígitos numéricos
 * - Se o celular possui exatamente 9 dígitos numéricos
 * - Se o email está em um formato válido
 * 
 * @returns {boolean} Retorna true se todas as validações passarem, false caso contrário
 */
function validarFormulario() {
    const cidade = document.getElementById('cidade').value;
    const ddd = document.getElementById('ddd').value;
    const celular = document.getElementById('celular').value;
    const email = document.getElementById('email').value;
    const endereco = document.getElementById('endereco').value;
    
    // Validação do endereço (não pode estar vazio)
    if (!endereco.trim()) {
        alert('Por favor, preencha o endereço.');
        return false;
    }
    
    // Validação da cidade (apenas letras e espaços)
    if (!cidade.trim()) {
        alert('Por favor, preencha a cidade.');
        return false;
    }
    if (!/^[A-Za-zÀ-ÿ ]+$/.test(cidade)) {
        alert('A cidade deve conter apenas letras e espaços.');
        return false;
    }
    
    // Validação do DDD (2 dígitos)
    if (!ddd.trim()) {
        alert('Por favor, preencha o DDD.');
        return false;
    }
    if (!/^[0-9]{2}$/.test(ddd)) {
        alert('O DDD deve conter exatamente 2 dígitos numéricos.');
        return false;
    }
    
    // Validação do celular (9 dígitos)
    if (!celular.trim()) {
        alert('Por favor, preencha o número do celular.');
        return false;
    }
    if (!/^[0-9]{9}$/.test(celular)) {
        alert('O celular deve conter exatamente 9 dígitos numéricos.');
        return false;
    }
    
    // Validação do email
    if (!email.trim()) {
        alert('Por favor, preencha o email.');
        return false;
    }
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        alert('Por favor, insira um email válido.');
        return false;
    }
    
    return true;
}

/**
 * Valida um número de CPF
 * 
 * Esta função realiza a validação completa de um CPF:
 * - Remove caracteres não numéricos
 * - Verifica se possui 11 dígitos
 * - Verifica se não são todos dígitos iguais
 * - Calcula e valida os dígitos verificadores
 * 
 * @param {string} cpf - O número do CPF a ser validado
 * @returns {boolean} Retorna true se o CPF for válido, false caso contrário
 */
function validarCPF(cpf) {
    // Remove caracteres não numéricos
    cpf = cpf.replace(/\D/g, '');
    
    // Verifica se tem 11 dígitos
    if (cpf.length !== 11) {
        return false;
    }
    
    // Verifica se todos os dígitos são iguais
    if (/^(\d)\1{10}$/.test(cpf)) {
        return false;
    }
    
    // Validação do primeiro dígito verificador
    let soma = 0;
    for (let i = 0; i < 9; i++) {
        soma += parseInt(cpf.charAt(i)) * (10 - i);
    }
    let digito1 = 11 - (soma % 11);
    if (digito1 > 9) digito1 = 0;
    if (parseInt(cpf.charAt(9)) !== digito1) {
        return false;
    }
    
    // Validação do segundo dígito verificador
    soma = 0;
    for (let i = 0; i < 10; i++) {
        soma += parseInt(cpf.charAt(i)) * (11 - i);
    }
    let digito2 = 11 - (soma % 11);
    if (digito2 > 9) digito2 = 0;
    if (parseInt(cpf.charAt(10)) !== digito2) {
        return false;
    }
    
    return true;
}

/**
 * Inicializa os eventos de formatação de campos
 * 
 * Este evento é disparado quando o DOM é completamente carregado e:
 * - Adiciona máscaras de formatação para campos como celular e CPF
 * - Aplica validações em tempo real enquanto o usuário digita
 * - Melhora a experiência do usuário com feedback visual imediato
 */
document.addEventListener('DOMContentLoaded', function() {
    const celularInput = document.getElementById('celular');
    if (celularInput) {
        celularInput.addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length > 9) value = value.slice(0, 9);
            e.target.value = value;
        });
    }
    
    const dddInput = document.getElementById('ddd');
    if (dddInput) {
        dddInput.addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length > 2) value = value.slice(0, 2);
            e.target.value = value;
        });
    }
    
    const cpfInput = document.getElementById('cpf');
    if (cpfInput) {
        cpfInput.addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length > 11) value = value.slice(0, 11);
            e.target.value = value;
        });
    }
});