# ⚙️ MODZANONY TOOLS

![banner](https://img.shields.io/badge/Made%20by-ModzAnoNy-green?style=for-the-badge)  
Ferramentas funcionais e reais para hacking ético no Termux 📱💻

> 🔒 Criado para quem busca estabilidade, personalização e utilitários úteis no dia a dia hacker!

---

## 📦 Funcionalidades

### 🔧 ModzFix
> Correções e manutenção do Termux:
- Atualizar pacotes
- Limpar cache
- Corrigir dependências quebradas
- Resetar configurações (bashrc)

### 🎭 ModzSpoof
> Gera identidades falsas 🇧🇷:
- Nome, cidade, estado, e-mail, telefone
- Salva relatório automaticamente (`spoof_data.txt`)

---

## 💻 Instalação

Abra o Termux e digite:

```bash
pkg update && pkg upgrade
pkg install git curl jq -y
git clone https://github.com/ModzAnoNy/Modz_tools
cd Modz_tools
chmod +x modz_tools.sh
./modz_tools.sh
