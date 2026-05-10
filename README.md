# Portal SALI

## Limitless UI

O portal deve seguir o exemplo oficial da `limitless_ui` clonado em
`referencias/limitless_ui`.

Referências principais:

- `referencias/limitless_ui/example/lib/src/pages/dropdown/dropdown_page.html`
- `referencias/limitless_ui/example/lib/src/pages/dropdown/dropdown_page.dart`
- `referencias/limitless_ui/lib/src/components/dropdown/dropdown.dart`

Regras adotadas no projeto:

- Usar `liDropdown`, `liDropdownToggle`, `liDropdownMenu` e `liDropdownItem` para
  dropdowns declarativos.
- Usar `liDropdownSubmenu`, `liDropdownSubmenuToggle` e
  `liDropdownSubmenuMenu` para submenus, igual ao exemplo oficial.
- Usar `container="body"` somente nos casos em que o exemplo recomenda:
  elementos dentro de containers com clipping/overflow. Dropdown de navbar deve
  ficar no fluxo normal da navbar.
- Não usar `href="javascript:void(0)"` nem atributos de Bootstrap JS
  (`data-bs-*`, `data-toggle`, `data-target`) para controlar componentes
  AngularDart.
- Manter `web/style.scss` sem correções globais para componentes da biblioteca.
