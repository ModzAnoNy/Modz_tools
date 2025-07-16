#!/bin/bash
# ModzAnoNy Tools - ModzFix & ModzSpoof
# GitHub: https://github.com/ModzAnoNy

# Cores
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Banner com nome MODZANONY
banner() {
  clear
  echo -e "${CYAN}"
  echo "███╗░░░███╗░█████╗░██████╗░███████╗███████╗███╗░░██╗░█████╗░███╗░░██╗██╗░░██╗"
  echo "████╗░████║██╔══██╗██╔══██╗██╔════╝██╔════╝████╗░██║██╔══██╗████╗░██║╚██╗██╔╝"
  echo "██╔████╔██║███████║██████╔╝█████╗░░█████╗░░██╔██╗██║███████║██╔██╗██║░╚███╔╝░"
  echo "██║╚██╔╝██║██╔══██║██╔═══╝░██╔══╝░░██╔══╝░░██║╚████║██╔══██║██║╚████║░██╔██╗░"
  echo "██║░╚═╝░██║██║░░██║██║░░░░░███████╗███████╗██║░╚███║██║░░██║██║░╚███║██╔╝╚██╗"
  echo "╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚══════╝╚══════╝╚═╝░░╚══╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝"
  echo -e "${NC}        GitHub: https://github.com/ModzAnoNy\n"
}

# Submenu: ModzFix
modz_fix() {
  while true; do
    echo -e "${GREEN}[MODZFIX MENU]${NC}"
    echo "[1] Atualizar pacotes"
    echo "[2] Limpar cache do Termux"
    echo "[3] Corrigir dependências"
    echo "[4] Resetar configurações (bashrc)"
    echo "[5] Voltar"
    echo -ne "Escolha: "; read fx
    case $fx in
      1) pkg update && pkg upgrade -y ;;
      2) apt clean && rm -rf /data/data/com.termux/cache/* ;;
      3) apt --fix-broken install ;;
      4) echo "# Reset bashrc by ModzFix" > ~/.bashrc && echo "clear" >> ~/.bashrc && echo "banner" >> ~/.bashrc ;;
      5) break ;;
      *) echo "Opção inválida" ;;
    esac
  done
}

# Submenu: ModzSpoof
modz_spoof() {
  while true; do
    echo -e "${YELLOW}[MODZSPOOF MENU]${NC}"
    echo "[1] Gerar identidade falsa (PT-BR)"
    echo "[2] Exportar última identidade"
    echo "[3] Voltar"
    echo -ne "Escolha: "; read sp
    case $sp in
      1)
        apt install -y curl jq > /dev/null 2>&1
        curl -s https://randomuser.me/api/?nat=br > temp.json
        nome=$(jq -r '.results[0].name.first + " " + .results[0].name.last' temp.json)
        cidade=$(jq -r '.results[0].location.city' temp.json)
        estado=$(jq -r '.results[0].location.state' temp.json)
        email=$(jq -r '.results[0].email' temp.json)
        telefone=$(jq -r '.results[0].phone' temp.json)
        echo -e "\n${CYAN}Nome: $nome\nCidade: $cidade\nEstado: $estado\nEmail: $email\nTelefone: $telefone${NC}\n" > spoof_data.txt
        cat spoof_data.txt
        ;;
      2)
        if [ -f spoof_data.txt ]; then
          cat spoof_data.txt
        else
          echo "Nenhuma identidade gerada ainda."
        fi
        ;;
      3) break ;;
      *) echo "Opção inválida" ;;
    esac
  done
}

# Menu principal
while true; do
  banner
  echo -e "${GREEN}============== MENU MODZANONY ==============${NC}"
  echo "[1] ModzFix - Manutenção do Termux"
  echo "[2] ModzSpoof - Gerador de identidade"
  echo "[3] Sair"
  echo -ne "Escolha: "; read op
  case $op in
    1) modz_fix ;;
    2) modz_spoof ;;
    3) echo "Saindo..."; exit ;;
    *) echo "Opção inválida" ;;
  esac
  echo -e "\nPressione ENTER para voltar ao menu principal..."
  read
  clear
  banner
  sleep 1
done
