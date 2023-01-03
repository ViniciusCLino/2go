const { exit } = require('process');
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Tipagem da numeração

const tipoNumero = (num) => {
    if(isPrimo(num)){
        return "Número primo"
    }
    else if((num % 3 === 0) || (num % 5 === 0)){
        return "Número esotérico"
    }
    else {
        return "Número cético"
    }
}

// Verificação de número primo

const isPrimo = (num) => {
    for (let i = 2; i < num; i++)
    if (num % i === 0) {
        return false;
    }
    return num > 1;
};

// Validação dos valores

const man = () => {
    rl.question('Digite um número inteiro?\r', (num) => {
        if(!/[0-9]+/.test(num)){
            console.log("O valor informado não é um número válido!")
            man()
            return
        }
        console.log(tipoNumero(num))
        man()
    })
}

// Recursividade da função

man();