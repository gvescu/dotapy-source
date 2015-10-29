tinymce.PluginManager.add("fullscreen",function(a){function b(){var a,b,c=window,d=document,e=d.body;return e.offsetWidth&&(a=e.offsetWidth,b=e.offsetHeight),c.innerWidth&&c.innerHeight&&(a=c.innerWidth,b=c.innerHeight),{w:a,h:b}}function c(){function c(){j.setStyle(m,"height",b().h-(l.clientHeight-m.clientHeight))}var k,l,m,n,o=document.body,p=document.documentElement;i=!i,l=a.getContainer(),k=l.style,m=a.getContentAreaContainer().firstChild,n=m.style,i?(d=n.width,e=n.height,n.width=n.height="100%",g=k.width,h=k.height,k.width=k.height="",j.addClass(o,"mce-fullscreen"),j.addClass(p,"mce-fullscreen"),j.addClass(l,"mce-fullscreen"),j.bind(window,"resize",c),c(),f=c):(n.width=d,n.height=e,g&&(k.width=g),h&&(k.height=h),j.removeClass(o,"mce-fullscreen"),j.removeClass(p,"mce-fullscreen"),j.removeClass(l,"mce-fullscreen"),j.unbind(window,"resize",f)),a.fire("FullscreenStateChanged",{state:i})}var d,e,f,g,h,i=!1,j=tinymce.DOM;return a.settings.inline?void 0:(a.on("init",function(){a.addShortcut("Ctrl+Alt+F","",c)}),a.on("remove",function(){f&&j.unbind(window,"resize",f)}),a.addCommand("mceFullScreen",c),a.addMenuItem("fullscreen",{text:"Fullscreen",shortcut:"Ctrl+Alt+F",selectable:!0,onClick:c,onPostRender:function(){var b=this;a.on("FullscreenStateChanged",function(a){b.active(a.state)})},context:"view"}),a.addButton("fullscreen",{tooltip:"Fullscreen",shortcut:"Ctrl+Alt+F",onClick:c,onPostRender:function(){var b=this;a.on("FullscreenStateChanged",function(a){b.active(a.state)})}}),{isFullscreen:function(){return i}})});