# Portal de Serviços - Protótipo SALI

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Acessar%20Protótipo-blue?style=for-the-badge&logo=github)](https://insinfo.github.io/portal_servicos/)

Este é um protótipo do **Portal do Cidadão**, integrado visualmente ao ecossistema SALI. O projeto foi desenvolvido para oferecer uma experiência moderna, intuitiva e responsiva para a solicitação e acompanhamento de serviços públicos.


## 🚀 Funcionalidades Implementadas

### Áreas Públicas
- **Página de Boas-Vindas**: Landing page com background em vídeo, apresentação institucional e acesso rápido aos módulos principais.
- **Autenticação**:
  - Fluxo de Login (estilizado com padrão Gov.br).
  - Cadastro de novo usuário.
  - Recuperação de senha (placeholder).

### Área Logada (Restrita)
- **Dashboard (Início)**: Visão geral com atalhos para os serviços mais utilizados e resumo de solicitações.
- **Catálogo de Serviços**: 
  - Busca em tempo real de serviços.
  - Filtragem por categorias (Limpeza Urbana, Infraestrutura, etc.).
  - Cards informativos com descrição e ícones.
- **Fluxo de Solicitação**:
  - Formulário de abertura de pedido ("Novo Pedido").
  - Tela de confirmação com número de protocolo gerado.
- **Minhas Solicitações**:
  - Listagem completa de pedidos realizados.
  - Indicadores estatísticos (Total, Em análise, Em execução, Concluídos).
  - Status coloridos para fácil identificação.
- **Perfil do Usuário**: Gestão de dados cadastrais e preferências.
- **Notificações**: Central de avisos e atualizações de status.
- **Ajuda e Suporte**: FAQ e canais de contato.

## 🎨 Interface e Layout

O portal utiliza o framework **Limitless UI** adaptado para AngularDart, oferecendo:
- **Layout Híbrido**: Suporte a dois modos de navegação (Sidebar lateral ou Navbar horizontal superior).
- **Tema Dark/Light**: Alternância dinâmica de cores.
- **Responsividade Total**: Otimizado para desktops, tablets e smartphones.
- **Componentes Modernos**: Uso intensivo de dropdowns complexos, modais, badges e ícones (Phosphor Icons).

## 🛠️ Stack Técnica

- **Framework**: AngularDart (ngdart 8.0.0-dev.4)
- **Roteamento**: ngrouter
- **Componentes**: Limitless UI (Biblioteca customizada)
- **Estilização**: SCSS / Bootstrap 5
- **Gerenciamento de Build**: build_runner

## 📏 Regras e Padrões Adotados

- **Componentes Declarativos**: Usar `liDropdown`, `liDropdownToggle`, `liDropdownMenu` e `liDropdownItem` para menus.
- **Submenus**: Implementar via `liDropdownSubmenu`, `liDropdownSubmenuToggle` e `liDropdownSubmenuMenu`.
- **Posicionamento**: O atributo `container="body"` deve ser usado apenas em elementos com problemas de clipping/overflow.
- **Interatividade**: Proibido o uso de `href="javascript:void(0)"` ou atributos `data-bs-*` nativos do Bootstrap para controle de componentes; toda a lógica deve ser gerenciada pelo AngularDart.
- **Estilos**: Manter `web/style.scss` limpo, evitando correções globais que possam sobrescrever a biblioteca base.

---
*Protótipo desenvolvido para a Prefeitura Municipal de Rio das Ostras.*

