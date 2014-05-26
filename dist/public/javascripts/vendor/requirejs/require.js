var requirejs,require,define;!function(global){function isFunction(e){return"[object Function]"===ostring.call(e)}function isArray(e){return"[object Array]"===ostring.call(e)}function each(e,t){if(e){var n;for(n=0;n<e.length&&(!e[n]||!t(e[n],n,e));n+=1);}}function eachReverse(e,t){if(e){var n;for(n=e.length-1;n>-1&&(!e[n]||!t(e[n],n,e));n-=1);}}function hasProp(e,t){return hasOwn.call(e,t)}function getOwn(e,t){return hasProp(e,t)&&e[t]}function eachProp(e,t){var n;for(n in e)if(hasProp(e,n)&&t(e[n],n))break}function mixin(e,t,n,i){return t&&eachProp(t,function(t,r){(n||!hasProp(e,r))&&(i&&"string"!=typeof t?(e[r]||(e[r]={}),mixin(e[r],t,n,i)):e[r]=t)}),e}function bind(e,t){return function(){return t.apply(e,arguments)}}function scripts(){return document.getElementsByTagName("script")}function defaultOnError(e){throw e}function getGlobal(e){if(!e)return e;var t=global;return each(e.split("."),function(e){t=t[e]}),t}function makeError(e,t,n,i){var r=new Error(t+"\nhttp://requirejs.org/docs/errors.html#"+e);return r.requireType=e,r.requireModules=i,n&&(r.originalError=n),r}function newContext(e){function t(e){var t,n;for(t=0;e[t];t+=1)if(n=e[t],"."===n)e.splice(t,1),t-=1;else if(".."===n){if(1===t&&(".."===e[2]||".."===e[0]))break;t>0&&(e.splice(t-1,2),t-=2)}}function n(e,n,i){var r,o,s,a,l,u,c,f,p,h,d,m=n&&n.split("/"),g=m,v=T.map,y=v&&v["*"];if(e&&"."===e.charAt(0)&&(n?(g=getOwn(T.pkgs,n)?m=[n]:m.slice(0,m.length-1),e=g.concat(e.split("/")),t(e),o=getOwn(T.pkgs,r=e[0]),e=e.join("/"),o&&e===r+"/"+o.main&&(e=r)):0===e.indexOf("./")&&(e=e.substring(2))),i&&v&&(m||y)){for(a=e.split("/"),l=a.length;l>0;l-=1){if(c=a.slice(0,l).join("/"),m)for(u=m.length;u>0;u-=1)if(s=getOwn(v,m.slice(0,u).join("/")),s&&(s=getOwn(s,c))){f=s,p=l;break}if(f)break;!h&&y&&getOwn(y,c)&&(h=getOwn(y,c),d=l)}!f&&h&&(f=h,p=d),f&&(a.splice(0,p,f),e=a.join("/"))}return e}function i(e){isBrowser&&each(scripts(),function(t){return t.getAttribute("data-requiremodule")===e&&t.getAttribute("data-requirecontext")===x.contextName?(t.parentNode.removeChild(t),!0):void 0})}function r(e){var t=getOwn(T.paths,e);return t&&isArray(t)&&t.length>1?(i(e),t.shift(),x.require.undef(e),x.require([e]),!0):void 0}function o(e){var t,n=e?e.indexOf("!"):-1;return n>-1&&(t=e.substring(0,n),e=e.substring(n+1,e.length)),[t,e]}function s(e,t,i,r){var s,a,l,u,c=null,f=t?t.name:null,p=e,h=!0,d="";return e||(h=!1,e="_@r"+(N+=1)),u=o(e),c=u[0],e=u[1],c&&(c=n(c,f,r),a=getOwn(j,c)),e&&(c?d=a&&a.normalize?a.normalize(e,function(e){return n(e,f,r)}):n(e,f,r):(d=n(e,f,r),u=o(d),c=u[0],d=u[1],i=!0,s=x.nameToUrl(d))),l=!c||a||i?"":"_unnormalized"+(q+=1),{prefix:c,name:d,parentMap:t,unnormalized:!!l,url:s,originalName:p,isDefine:h,id:(c?c+"!"+d:d)+l}}function a(e){var t=e.id,n=getOwn(k,t);return n||(n=k[t]=new x.Module(e)),n}function l(e,t,n){var i=e.id,r=getOwn(k,i);!hasProp(j,i)||r&&!r.defineEmitComplete?(r=a(e),r.error&&"error"===t?n(r.error):r.on(t,n)):"defined"===t&&n(j[i])}function u(e,t){var n=e.requireModules,i=!1;t?t(e):(each(n,function(t){var n=getOwn(k,t);n&&(n.error=e,n.events.error&&(i=!0,n.emit("error",e)))}),i||req.onError(e))}function c(){globalDefQueue.length&&(apsp.apply($,[$.length-1,0].concat(globalDefQueue)),globalDefQueue=[])}function f(e){delete k[e],delete E[e]}function p(e,t,n){var i=e.map.id;e.error?e.emit("error",e.error):(t[i]=!0,each(e.depMaps,function(i,r){var o=i.id,s=getOwn(k,o);!s||e.depMatched[r]||n[o]||(getOwn(t,o)?(e.defineDep(r,j[o]),e.check()):p(s,t,n))}),n[i]=!0)}function h(){var e,t,n,o,s=1e3*T.waitSeconds,a=s&&x.startTime+s<(new Date).getTime(),l=[],c=[],f=!1,d=!0;if(!y){if(y=!0,eachProp(E,function(n){if(e=n.map,t=e.id,n.enabled&&(e.isDefine||c.push(n),!n.error))if(!n.inited&&a)r(t)?(o=!0,f=!0):(l.push(t),i(t));else if(!n.inited&&n.fetched&&e.isDefine&&(f=!0,!e.prefix))return d=!1}),a&&l.length)return n=makeError("timeout","Load timeout for modules: "+l,null,l),n.contextName=x.contextName,u(n);d&&each(c,function(e){p(e,{},{})}),a&&!o||!f||!isBrowser&&!isWebWorker||C||(C=setTimeout(function(){C=0,h()},50)),y=!1}}function d(e){hasProp(j,e[0])||a(s(e[0],null,!0)).init(e[1],e[2])}function m(e,t,n,i){e.detachEvent&&!isOpera?i&&e.detachEvent(i,t):e.removeEventListener(n,t,!1)}function g(e){var t=e.currentTarget||e.srcElement;return m(t,x.onScriptLoad,"load","onreadystatechange"),m(t,x.onScriptError,"error"),{node:t,id:t&&t.getAttribute("data-requiremodule")}}function v(){var e;for(c();$.length;){if(e=$.shift(),null===e[0])return u(makeError("mismatch","Mismatched anonymous define() module: "+e[e.length-1]));d(e)}}var y,b,x,w,C,T={waitSeconds:7,baseUrl:"./",paths:{},pkgs:{},shim:{},config:{}},k={},E={},S={},$=[],j={},D={},N=1,q=1;return w={require:function(e){return e.require?e.require:e.require=x.makeRequire(e.map)},exports:function(e){return e.usingExports=!0,e.map.isDefine?e.exports?e.exports:e.exports=j[e.map.id]={}:void 0},module:function(e){return e.module?e.module:e.module={id:e.map.id,uri:e.map.url,config:function(){var t,n=getOwn(T.pkgs,e.map.id);return t=n?getOwn(T.config,e.map.id+"/"+n.main):getOwn(T.config,e.map.id),t||{}},exports:j[e.map.id]}}},b=function(e){this.events=getOwn(S,e.id)||{},this.map=e,this.shim=getOwn(T.shim,e.id),this.depExports=[],this.depMaps=[],this.depMatched=[],this.pluginMaps={},this.depCount=0},b.prototype={init:function(e,t,n,i){i=i||{},this.inited||(this.factory=t,n?this.on("error",n):this.events.error&&(n=bind(this,function(e){this.emit("error",e)})),this.depMaps=e&&e.slice(0),this.errback=n,this.inited=!0,this.ignore=i.ignore,i.enabled||this.enabled?this.enable():this.check())},defineDep:function(e,t){this.depMatched[e]||(this.depMatched[e]=!0,this.depCount-=1,this.depExports[e]=t)},fetch:function(){if(!this.fetched){this.fetched=!0,x.startTime=(new Date).getTime();var e=this.map;return this.shim?(x.makeRequire(this.map,{enableBuildCallback:!0})(this.shim.deps||[],bind(this,function(){return e.prefix?this.callPlugin():this.load()})),void 0):e.prefix?this.callPlugin():this.load()}},load:function(){var e=this.map.url;D[e]||(D[e]=!0,x.load(this.map.id,e))},check:function(){if(this.enabled&&!this.enabling){var e,t,n=this.map.id,i=this.depExports,exports=this.exports,r=this.factory;if(this.inited){if(this.error)this.emit("error",this.error);else if(!this.defining){if(this.defining=!0,this.depCount<1&&!this.defined){if(isFunction(r)){if(this.events.error&&this.map.isDefine||req.onError!==defaultOnError)try{exports=x.execCb(n,r,i,exports)}catch(o){e=o}else exports=x.execCb(n,r,i,exports);if(this.map.isDefine&&(t=this.module,t&&void 0!==t.exports&&t.exports!==this.exports?exports=t.exports:void 0===exports&&this.usingExports&&(exports=this.exports)),e)return e.requireMap=this.map,e.requireModules=this.map.isDefine?[this.map.id]:null,e.requireType=this.map.isDefine?"define":"require",u(this.error=e)}else exports=r;this.exports=exports,this.map.isDefine&&!this.ignore&&(j[n]=exports,req.onResourceLoad&&req.onResourceLoad(x,this.map,this.depMaps)),f(n),this.defined=!0}this.defining=!1,this.defined&&!this.defineEmitted&&(this.defineEmitted=!0,this.emit("defined",this.exports),this.defineEmitComplete=!0)}}else this.fetch()}},callPlugin:function(){var e=this.map,t=e.id,i=s(e.prefix);this.depMaps.push(i),l(i,"defined",bind(this,function(i){var r,o,c,p=this.map.name,h=this.map.parentMap?this.map.parentMap.name:null,d=x.makeRequire(e.parentMap,{enableBuildCallback:!0});return this.map.unnormalized?(i.normalize&&(p=i.normalize(p,function(e){return n(e,h,!0)})||""),o=s(e.prefix+"!"+p,this.map.parentMap),l(o,"defined",bind(this,function(e){this.init([],function(){return e},null,{enabled:!0,ignore:!0})})),c=getOwn(k,o.id),c&&(this.depMaps.push(o),this.events.error&&c.on("error",bind(this,function(e){this.emit("error",e)})),c.enable()),void 0):(r=bind(this,function(e){this.init([],function(){return e},null,{enabled:!0})}),r.error=bind(this,function(e){this.inited=!0,this.error=e,e.requireModules=[t],eachProp(k,function(e){0===e.map.id.indexOf(t+"_unnormalized")&&f(e.map.id)}),u(e)}),r.fromText=bind(this,function(n,i){var o=e.name,l=s(o),c=useInteractive;i&&(n=i),c&&(useInteractive=!1),a(l),hasProp(T.config,t)&&(T.config[o]=T.config[t]);try{req.exec(n)}catch(f){return u(makeError("fromtexteval","fromText eval for "+t+" failed: "+f,f,[t]))}c&&(useInteractive=!0),this.depMaps.push(l),x.completeLoad(o),d([o],r)}),i.load(e.name,d,r,T),void 0)})),x.enable(i,this),this.pluginMaps[i.id]=i},enable:function(){E[this.map.id]=this,this.enabled=!0,this.enabling=!0,each(this.depMaps,bind(this,function(e,t){var n,i,r;if("string"==typeof e){if(e=s(e,this.map.isDefine?this.map:this.map.parentMap,!1,!this.skipMap),this.depMaps[t]=e,r=getOwn(w,e.id))return this.depExports[t]=r(this),void 0;this.depCount+=1,l(e,"defined",bind(this,function(e){this.defineDep(t,e),this.check()})),this.errback&&l(e,"error",bind(this,this.errback))}n=e.id,i=k[n],hasProp(w,n)||!i||i.enabled||x.enable(e,this)})),eachProp(this.pluginMaps,bind(this,function(e){var t=getOwn(k,e.id);t&&!t.enabled&&x.enable(e,this)})),this.enabling=!1,this.check()},on:function(e,t){var n=this.events[e];n||(n=this.events[e]=[]),n.push(t)},emit:function(e,t){each(this.events[e],function(e){e(t)}),"error"===e&&delete this.events[e]}},x={config:T,contextName:e,registry:k,defined:j,urlFetched:D,defQueue:$,Module:b,makeModuleMap:s,nextTick:req.nextTick,onError:u,configure:function(e){e.baseUrl&&"/"!==e.baseUrl.charAt(e.baseUrl.length-1)&&(e.baseUrl+="/");var t=T.pkgs,n=T.shim,i={paths:!0,config:!0,map:!0};eachProp(e,function(e,t){i[t]?"map"===t?(T.map||(T.map={}),mixin(T[t],e,!0,!0)):mixin(T[t],e,!0):T[t]=e}),e.shim&&(eachProp(e.shim,function(e,t){isArray(e)&&(e={deps:e}),!e.exports&&!e.init||e.exportsFn||(e.exportsFn=x.makeShimExports(e)),n[t]=e}),T.shim=n),e.packages&&(each(e.packages,function(e){var n;e="string"==typeof e?{name:e}:e,n=e.location,t[e.name]={name:e.name,location:n||e.name,main:(e.main||"main").replace(currDirRegExp,"").replace(jsSuffixRegExp,"")}}),T.pkgs=t),eachProp(k,function(e,t){e.inited||e.map.unnormalized||(e.map=s(t))}),(e.deps||e.callback)&&x.require(e.deps||[],e.callback)},makeShimExports:function(e){function t(){var t;return e.init&&(t=e.init.apply(global,arguments)),t||e.exports&&getGlobal(e.exports)}return t},makeRequire:function(t,i){function r(n,o,l){var c,f,p;return i.enableBuildCallback&&o&&isFunction(o)&&(o.__requireJsBuild=!0),"string"==typeof n?isFunction(o)?u(makeError("requireargs","Invalid require call"),l):t&&hasProp(w,n)?w[n](k[t.id]):req.get?req.get(x,n,t,r):(f=s(n,t,!1,!0),c=f.id,hasProp(j,c)?j[c]:u(makeError("notloaded",'Module name "'+c+'" has not been loaded yet for context: '+e+(t?"":". Use require([])")))):(v(),x.nextTick(function(){v(),p=a(s(null,t)),p.skipMap=i.skipMap,p.init(n,o,l,{enabled:!0}),h()}),r)}return i=i||{},mixin(r,{isBrowser:isBrowser,toUrl:function(e){var i,r=e.lastIndexOf("."),o=e.split("/")[0],s="."===o||".."===o;return-1!==r&&(!s||r>1)&&(i=e.substring(r,e.length),e=e.substring(0,r)),x.nameToUrl(n(e,t&&t.id,!0),i,!0)},defined:function(e){return hasProp(j,s(e,t,!1,!0).id)},specified:function(e){return e=s(e,t,!1,!0).id,hasProp(j,e)||hasProp(k,e)}}),t||(r.undef=function(e){c();var n=s(e,t,!0),i=getOwn(k,e);delete j[e],delete D[n.url],delete S[e],i&&(i.events.defined&&(S[e]=i.events),f(e))}),r},enable:function(e){var t=getOwn(k,e.id);t&&a(e).enable()},completeLoad:function(e){var t,n,i,o=getOwn(T.shim,e)||{},s=o.exports;for(c();$.length;){if(n=$.shift(),null===n[0]){if(n[0]=e,t)break;t=!0}else n[0]===e&&(t=!0);d(n)}if(i=getOwn(k,e),!t&&!hasProp(j,e)&&i&&!i.inited){if(!(!T.enforceDefine||s&&getGlobal(s)))return r(e)?void 0:u(makeError("nodefine","No define call for "+e,null,[e]));d([e,o.deps||[],o.exportsFn])}h()},nameToUrl:function(e,t,n){var i,r,o,s,a,l,u,c,f;if(req.jsExtRegExp.test(e))c=e+(t||"");else{for(i=T.paths,r=T.pkgs,a=e.split("/"),l=a.length;l>0;l-=1){if(u=a.slice(0,l).join("/"),o=getOwn(r,u),f=getOwn(i,u)){isArray(f)&&(f=f[0]),a.splice(0,l,f);break}if(o){s=e===o.name?o.location+"/"+o.main:o.location,a.splice(0,l,s);break}}c=a.join("/"),c+=t||(/\?/.test(c)||n?"":".js"),c=("/"===c.charAt(0)||c.match(/^[\w\+\.\-]+:/)?"":T.baseUrl)+c}return T.urlArgs?c+((-1===c.indexOf("?")?"?":"&")+T.urlArgs):c},load:function(e,t){req.load(x,e,t)},execCb:function(e,t,n,exports){return t.apply(exports,n)},onScriptLoad:function(e){if("load"===e.type||readyRegExp.test((e.currentTarget||e.srcElement).readyState)){interactiveScript=null;var t=g(e);x.completeLoad(t.id)}},onScriptError:function(e){var t=g(e);return r(t.id)?void 0:u(makeError("scripterror","Script error for: "+t.id,e,[t.id]))}},x.require=x.makeRequire(),x}function getInteractiveScript(){return interactiveScript&&"interactive"===interactiveScript.readyState?interactiveScript:(eachReverse(scripts(),function(e){return"interactive"===e.readyState?interactiveScript=e:void 0}),interactiveScript)}var req,s,head,baseElement,dataMain,src,interactiveScript,currentlyAddingScript,mainScript,subPath,version="2.1.8",commentRegExp=/(\/\*([\s\S]*?)\*\/|([^:]|^)\/\/(.*)$)/gm,cjsRequireRegExp=/[^.]\s*require\s*\(\s*["']([^'"\s]+)["']\s*\)/g,jsSuffixRegExp=/\.js$/,currDirRegExp=/^\.\//,op=Object.prototype,ostring=op.toString,hasOwn=op.hasOwnProperty,ap=Array.prototype,apsp=ap.splice,isBrowser=!("undefined"==typeof window||!navigator||!window.document),isWebWorker=!isBrowser&&"undefined"!=typeof importScripts,readyRegExp=isBrowser&&"PLAYSTATION 3"===navigator.platform?/^complete$/:/^(complete|loaded)$/,defContextName="_",isOpera="undefined"!=typeof opera&&"[object Opera]"===opera.toString(),contexts={},cfg={},globalDefQueue=[],useInteractive=!1;if("undefined"==typeof define){if("undefined"!=typeof requirejs){if(isFunction(requirejs))return;cfg=requirejs,requirejs=void 0}"undefined"==typeof require||isFunction(require)||(cfg=require,require=void 0),req=requirejs=function(e,t,n,i){var r,o,s=defContextName;return isArray(e)||"string"==typeof e||(o=e,isArray(t)?(e=t,t=n,n=i):e=[]),o&&o.context&&(s=o.context),r=getOwn(contexts,s),r||(r=contexts[s]=req.s.newContext(s)),o&&r.configure(o),r.require(e,t,n)},req.config=function(e){return req(e)},req.nextTick="undefined"!=typeof setTimeout?function(e){setTimeout(e,4)}:function(e){e()},require||(require=req),req.version=version,req.jsExtRegExp=/^\/|:|\?|\.js$/,req.isBrowser=isBrowser,s=req.s={contexts:contexts,newContext:newContext},req({}),each(["toUrl","undef","defined","specified"],function(e){req[e]=function(){var t=contexts[defContextName];return t.require[e].apply(t,arguments)}}),isBrowser&&(head=s.head=document.getElementsByTagName("head")[0],baseElement=document.getElementsByTagName("base")[0],baseElement&&(head=s.head=baseElement.parentNode)),req.onError=defaultOnError,req.createNode=function(e){var t=e.xhtml?document.createElementNS("http://www.w3.org/1999/xhtml","html:script"):document.createElement("script");return t.type=e.scriptType||"text/javascript",t.charset="utf-8",t.async=!0,t},req.load=function(e,t,n){var i,r=e&&e.config||{};if(isBrowser)return i=req.createNode(r,t,n),i.setAttribute("data-requirecontext",e.contextName),i.setAttribute("data-requiremodule",t),!i.attachEvent||i.attachEvent.toString&&i.attachEvent.toString().indexOf("[native code")<0||isOpera?(i.addEventListener("load",e.onScriptLoad,!1),i.addEventListener("error",e.onScriptError,!1)):(useInteractive=!0,i.attachEvent("onreadystatechange",e.onScriptLoad)),i.src=n,currentlyAddingScript=i,baseElement?head.insertBefore(i,baseElement):head.appendChild(i),currentlyAddingScript=null,i;if(isWebWorker)try{importScripts(n),e.completeLoad(t)}catch(o){e.onError(makeError("importscripts","importScripts failed for "+t+" at "+n,o,[t]))}},isBrowser&&eachReverse(scripts(),function(e){return head||(head=e.parentNode),dataMain=e.getAttribute("data-main"),dataMain?(mainScript=dataMain,cfg.baseUrl||(src=mainScript.split("/"),mainScript=src.pop(),subPath=src.length?src.join("/")+"/":"./",cfg.baseUrl=subPath),mainScript=mainScript.replace(jsSuffixRegExp,""),req.jsExtRegExp.test(mainScript)&&(mainScript=dataMain),cfg.deps=cfg.deps?cfg.deps.concat(mainScript):[mainScript],!0):void 0}),define=function(e,t,n){var i,r;"string"!=typeof e&&(n=t,t=e,e=null),isArray(t)||(n=t,t=null),!t&&isFunction(n)&&(t=[],n.length&&(n.toString().replace(commentRegExp,"").replace(cjsRequireRegExp,function(e,n){t.push(n)}),t=(1===n.length?["require"]:["require","exports","module"]).concat(t))),useInteractive&&(i=currentlyAddingScript||getInteractiveScript(),i&&(e||(e=i.getAttribute("data-requiremodule")),r=contexts[i.getAttribute("data-requirecontext")])),(r?r.defQueue:globalDefQueue).push([e,t,n])},define.amd={jQuery:!0},req.exec=function(text){return eval(text)},req(cfg)}}(this);