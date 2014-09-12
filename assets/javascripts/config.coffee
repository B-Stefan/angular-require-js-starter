requirejs.config
  #urlArgs: "bust=" +  (new Date()).getTime()

  paths:
    c:"controllers"
    l18n:"vendor/l18n"
    jquery:"vendor/jquery"
    ang:"vendor/angular/angular"
    'angular-ui-router': 'vendor/angular-ui-router/angular-ui-router'
    'angular-ui-bootstrap': 'vendor/angular-bootstrap/ui-bootstrap-tpls'
    'angular-servicestack':'vendor/angular-servicestack/angular-servicestack'
    'angular-ui-grid': 'vendor/angular-ui-grid/ui-grid-unstable'
    'angular-resource': 'vendor/angular-resource/angular-resource'
    'angular-ui-table': 'vendor/ng-table/ng-table'
  shim:
    'angular-ui-grid':
      deps: ['ang', 'jquery']
      exports: 'angular'
    'angular-ui-router':
      deps: ['ang']
    'angular-ui-table':
      deps: ['ang']
    'angular-ui-bootstrap':
      deps: ['ang']
    'angular-servicestack':
      deps: ['ang']
    'ang':
      deps: ['vendor/modernizr']
      exports: 'angular'
    'angular-resource': ['ang']
    'vendor/modernizr':
      exports: 'Modernizr'