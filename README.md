# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.


## Personal Notes
1. Configuração inicial de criar um ambiente linux dentro do windows
    1.1. Motivo
        As aplicações sobem em um servidor Linux, portanto criar um ambiente Linux 
        traz mais compatibilidade para executar comandos e bibliotecas
    1.2. Instalação e Configuração
        1.2.1 Instalar o WSL
            No CMD
            wsl --install
            define user vhsbc
            define pass 123
        1.2.2. Ubuntu
            no Microsoft Store
            Procurar por Ubuntu
            Nesse estudo foi usado o Ubuntu 24.04.1 LTS            
        1.2.3. Definir limites
            mover o arquivo .wslconfig para %userprofile%

2. Instalação NVM
    2.1. Motivo
        O NVM é o Node com multiplas versões, com o NVM não ficamos preso a uma versão do Node
    2.2. Instalação e Configuração
        Ir no GIT do NVM
        https://github.com/nvm-sh/nvm
        pegar o comando de install e update
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
        abrir o Ubunto e colar o comando
        em seguida, rodar o comando export
        export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
        testar com comando nvm
3. Instalação Node LTS no NVM
    3.1. Motivo
        Versão do Node usada para o projeto
    3.2. Instalação e Configuração
        rodar o comando nvm install --lts
        nesse estudo, lts é a versão 22
        confirmar com o node -v
        para instalar uma versão especifica
        nvm install 20
        para mover para outra versão
        nvm use 18
        para desinstalar uma versão
        nvm uninstall 20 (mover antes de desinstalar)
        depois do nvm install --lts, o node -v retorna 24.12.0
4. VsCode
    4.1. Motivos
        Necessário para desenvolvimento
    4.2. Instalação
        Pesquisar por VSCode no Google
    4.3. Extensões
        4.3.1 WSL
            Acessar o VSCode de dentro do VSCode diretamente
        4.3.2. Rest Client
            Executar ações HTTP dentro do VSCode
        4.3.3. Rainbow CSV
            Melhor visualização do arquivo csv
        4.3.4. Reload (Opcional)
            Para reiniciar o vscode sem precisar linha de comando
		4.3.5. SAP CDS Language Support
			Suporte para cap no vscode
        4.3.6. SQLite
            SQLite é o banco de dados local
            CTRL + SHIFT + P > Open Database > db.lite
            vai gerar erro no WSL após executar, rodar o comando abaixo
            sudo apt install sqlite3
			gerar o arquivo db.sqlite com o comando abaixo
			cds deploy -2 sqlite:db.sqlite
			após gerar o arquivo db.sqlite, deve-se alterar o .cdsrc.json
			de ":memory:" para "db.sqlite"
			depois que é gerado, voltar no comando            
			CTRL + SHIFT + P > Open Database > db.lite
			no explorer vai aparecer uma aba SQLITE EXPLORER com a visualização do DB local
            a conversão do type é feita pelo CAP, exemplo:
			no CAP é varchar, mas no DB XPTO é char, o próprio CAP entende o tipo e converte conforme o banco
			O próprio CAP entende os relacionamentos de association e composition e faz as views no SQLITE EXPLORER
			memory usa em tempo de criação do schema
			sqlite usa quando o schema já está definido
			isso porque qualquer alteração é necessário refazer o db


5. Instalação sap/cds-dk
    5.1. Motivo
        linha de comando do cap para node
    5.2. Instalação
        Abrir o VsCode no WSL
        abrir o terminal, digitar npm i -g sap/cds-dk

6. Criando o projeto
	Abrir o terminal e executar:
		mkdir projects
		cds init nome-do-projeto
		cd nome-do-projeto
		code .
	
	Estrutura do projeto:
		arquivo .vscode
			Contém arquivos de configurações e utilitários do vscode, também usado para debug
		pasta app
			arquivos do frontend, no curso de backend não será abordado
		pasta db
			entidades e arquivos csv com dados das entidades
		pasta srv
			serviços e lógicas customizadas
		arquivo package.json
			Inicialmente só contém o mínimo para rodar o CAP

7. Github
	7.1. Sincronizar o projeto com o git
	7.2. Criar um repositorio padrão, publico, com o nome do projeto
	7.3. Entrar na pasta do projeto e rodar os comandos
		git init
		git add .
		git commit -m "first commit"
		git branch -M main
		git remote add origin https://github.com/vhsbc/sales-order-backend.git
		git push -u origin main

8. .gitconfig
	Utilitário para git, arquivo .gitconfig na raiz do WSL, não no projeto.
	Usado no curso
		[user]
		email = vhsbc92@gmail.com
		name = Victor Cardoso
		[credential]
			helper = store
		[core]
			editor = code --wait
		[alias]
		s = !git status -s
		c = !git add --all && git commit -m
		l = !git log --pretty=format:'%C(blue)%h%C(red)%d %C(white)%s - %C(cyan)%cn, %C(green)%cr'
		cm = !git checkout master && git pull origin master
		cn = !git add --all && git commit --no-verify -m
		pu = !git pull origin
		po = !git push origin
		pon = !git push origin --no-verify

9. arquivo .cdsrc.json
	guarda as configurações do projeto CAP
	autenticação
	banco de dados
	tamanho em byte do payload
	configuração de pastas
	criar o arquivo .cdsrc.json na raiz do projeto
	essa configuração pode ser feita no package.json, mas existe uma separação por objetivo de arquivo
	package.json guarda dependências, scripts, bibliotecas por ambientes, etc
	criar ele com o conteúdo
	{
    "[development]": {
        "requires":{
            "db":{
                "credentials":{
                    "database": ":memory:"
                },
                "kind": "sqlite"
            }
        }
    },
    "[production]": {}
}
9. .bashrc
	aparecer o nome da branch que está conectado
	abrir o arquivo que está na pasta global
	adicionar o texto no final e reabrir o terminal para ver a mudança
	# Reset
	Color_Off='\033[0m'       # Text Reset
	
	# Regular Colors
	Black='\033[0;30m'        # Black
	Red='\033[0;31m'          # Red
	Green='\033[0;32m'        # Green
	Yellow='\033[0;33m'       # Yellow
	Blue='\033[0;34m'         # Blue
	Purple='\033[0;35m'       # Purple
	Cyan='\033[0;36m'         # Cyan
	White='\033[0;37m'        # White
	
	# Bold
	BBlack='\033[1;30m'       # Black
	BRed='\033[1;31m'         # Red
	BGreen='\033[1;32m'       # Green
	BYellow='\033[1;33m'      # Yellow
	BBlue='\033[1;34m'        # Blue
	BPurple='\033[1;35m'      # Purple
	BCyan='\033[1;36m'        # Cyan
	BWhite='\033[1;37m'       # White
	
	parse_git_branch() {
		git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
	}
	#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
	export PS1="${BGreen}\u ${BBlue}\w${BRed}\$(parse_git_branch)\[\033[00m\] $ "
	
	
10. Yarn
	Roda comandos npm mais rapidos
	npm i -g yarn

11. Instalar dependências
	rodar comando yarn

12. package.json
	adicionar o script "dev"
	"dev": "cds watch"

13. conventional commits
	na pasta do projeto
	yarn add -D git-commit-msg-linter

14. Pasta test
	essa pasta é analisada pelo CAP e não é enviada no deploy
	usado apenas para testes
	
	14.1. pasta test/http
		essa pasta contém as execuções de CRUD para testar os endpoints do cap
	
	14.2. pasta test/data
		essa pasta contém os arquivos csv onde estão os dados mockados
		essa pasta e os dados mockados são adicionados via comando
		comand line: cds add data --records 10 --out test/data
		ou mais simples: cds add data -n 10 --out test/data