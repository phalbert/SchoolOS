var mod_pagespeed_DiVk8z8s7L = "if(typeof jQuery==='undefined'){throw new Error('Jasny Bootstrap\\'s JavaScript requires jQuery')}+function($){'use strict';function transitionEnd(){var el=document.createElement('bootstrap')\nvar transEndEventNames={WebkitTransition:'webkitTransitionEnd',MozTransition:'transitionend',OTransition:'oTransitionEnd otransitionend',transition:'transitionend'}\nfor(var name in transEndEventNames){if(el.style[name]!==undefined){return{end:transEndEventNames[name]}}}return false}if($.support.transition!==undefined)return\n$.fn.emulateTransitionEnd=function(duration){var called=false,$el=this\n$(this).one($.support.transition.end,function(){called=true})\nvar callback=function(){if(!called)$($el).trigger($.support.transition.end)}\nsetTimeout(callback,duration)\nreturn this}\n$(function(){$.support.transition=transitionEnd()})}(window.jQuery);+function($){\"use strict\";var OffCanvas=function(element,options){this.$element=$(element)\nthis.options=$.extend({},OffCanvas.DEFAULTS,options)\nthis.state=null\nthis.placement=null\nif(this.options.recalc){this.calcClone()\n$(window).on('resize',$.proxy(this.recalc,this))}if(this.options.autohide)$(document).on('click',$.proxy(this.autohide,this))\nif(this.options.toggle)this.toggle()\nif(this.options.disablescrolling){this.options.disableScrolling=this.options.disablescrolling\ndelete this.options.disablescrolling}}\nOffCanvas.DEFAULTS={toggle:true,placement:'auto',autohide:true,recalc:true,disableScrolling:true,modal:false}\nOffCanvas.prototype.offset=function(){switch(this.placement){case'left':case'right':return this.$element.outerWidth()\ncase'top':case'bottom':return this.$element.outerHeight()}}\nOffCanvas.prototype.calcPlacement=function(){if(this.options.placement!=='auto'){this.placement=this.options.placement\nreturn}if(!this.$element.hasClass('in')){this.$element.css('visiblity','hidden !important').addClass('in')}var horizontal=$(window).width()/this.$element.width()\nvar vertical=$(window).height()/this.$element.height()\nvar element=this.$element\nfunction ab(a,b){if(element.css(b)==='auto')return a\nif(element.css(a)==='auto')return b\nvar size_a=parseInt(element.css(a),10)\nvar size_b=parseInt(element.css(b),10)\nreturn size_a>size_b?b:a}this.placement=horizontal>=vertical?ab('left','right'):ab('top','bottom')\nif(this.$element.css('visibility')==='hidden !important'){this.$element.removeClass('in').css('visiblity','')}}\nOffCanvas.prototype.opposite=function(placement){switch(placement){case'top':return'bottom'\ncase'left':return'right'\ncase'bottom':return'top'\ncase'right':return'left'}}\nOffCanvas.prototype.getCanvasElements=function(){var canvas=this.options.canvas?$(this.options.canvas):this.$element\nvar fixed_elements=canvas.find('*').filter(function(){return $(this).css('position')==='fixed'}).not(this.options.exclude)\nreturn canvas.add(fixed_elements)}\nOffCanvas.prototype.slide=function(elements,offset,callback){if(!$.support.transition){var anim={}\nanim[this.placement]=\"+=\"+offset\nreturn elements.animate(anim,350,callback)}var placement=this.placement\nvar opposite=this.opposite(placement)\nelements.each(function(){if($(this).css(placement)!=='auto')$(this).css(placement,(parseInt($(this).css(placement),10)||0)+offset)\nif($(this).css(opposite)!=='auto')$(this).css(opposite,(parseInt($(this).css(opposite),10)||0)-offset)})\nthis.$element.one($.support.transition.end,callback).emulateTransitionEnd(350)}\nOffCanvas.prototype.disableScrolling=function(){var bodyWidth=$('body').width()\nvar prop='padding-'+this.opposite(this.placement)\nif($('body').data('offcanvas-style')===undefined){$('body').data('offcanvas-style',$('body').attr('style')||'')}$('body').css('overflow','hidden')\nif($('body').width()>bodyWidth){var padding=parseInt($('body').css(prop),10)+$('body').width()-bodyWidth\nsetTimeout(function(){$('body').css(prop,padding)},1)}$('body').on('touchmove.bs',function(e){e.preventDefault();});}\nOffCanvas.prototype.enableScrolling=function(){$('body').off('touchmove.bs');}\nOffCanvas.prototype.show=function(){if(this.state)return\nvar startEvent=$.Event('show.bs.offcanvas')\nthis.$element.trigger(startEvent)\nif(startEvent.isDefaultPrevented())return\nthis.state='slide-in'\nthis.calcPlacement();var elements=this.getCanvasElements()\nvar placement=this.placement\nvar opposite=this.opposite(placement)\nvar offset=this.offset()\nif(elements.index(this.$element)!==-1){$(this.$element).data('offcanvas-style',$(this.$element).attr('style')||'')\nthis.$element.css(placement,-1*offset)\nthis.$element.css(placement);}elements.addClass('canvas-sliding').each(function(){if($(this).data('offcanvas-style')===undefined)$(this).data('offcanvas-style',$(this).attr('style')||'')\nif($(this).css('position')==='static')$(this).css('position','relative')\nif(($(this).css(placement)==='auto'||$(this).css(placement)==='0px')&&($(this).css(opposite)==='auto'||$(this).css(opposite)==='0px')){$(this).css(placement,0)}})\nif(this.options.disableScrolling)this.disableScrolling()\nif(this.options.modal)this.toggleBackdrop()\nvar complete=function(){if(this.state!='slide-in')return\nthis.state='slid'\nelements.removeClass('canvas-sliding').addClass('canvas-slid')\nthis.$element.trigger('shown.bs.offcanvas')}\nsetTimeout($.proxy(function(){this.$element.addClass('in')\nthis.slide(elements,offset,$.proxy(complete,this))},this),1)}\nOffCanvas.prototype.hide=function(fast){if(this.state!=='slid')return\nvar startEvent=$.Event('hide.bs.offcanvas')\nthis.$element.trigger(startEvent)\nif(startEvent.isDefaultPrevented())return\nthis.state='slide-out'\nvar elements=$('.canvas-slid')\nvar placement=this.placement\nvar offset=-1*this.offset()\nvar complete=function(){if(this.state!='slide-out')return\nthis.state=null\nthis.placement=null\nthis.$element.removeClass('in')\nelements.removeClass('canvas-sliding')\nelements.add(this.$element).add('body').each(function(){$(this).attr('style',$(this).data('offcanvas-style')).removeData('offcanvas-style')})\nthis.$element.trigger('hidden.bs.offcanvas')}\nif(this.options.disableScrolling)this.enableScrolling()\nif(this.options.modal)this.toggleBackdrop()\nelements.removeClass('canvas-slid').addClass('canvas-sliding')\nsetTimeout($.proxy(function(){this.slide(elements,offset,$.proxy(complete,this))},this),1)}\nOffCanvas.prototype.toggle=function(){if(this.state==='slide-in'||this.state==='slide-out')return\nthis[this.state==='slid'?'hide':'show']()}\nOffCanvas.prototype.toggleBackdrop=function(callback){callback=callback||$.noop;if(this.state=='slide-in'){var doAnimate=$.support.transition;this.$backdrop=$('<div class=\"modal-backdrop fade\" />').insertAfter(this.$element);if(doAnimate)this.$backdrop[0].offsetWidth\nthis.$backdrop.addClass('in')\ndoAnimate?this.$backdrop.one($.support.transition.end,callback).emulateTransitionEnd(150):callback()}else if(this.state=='slide-out'&&this.$backdrop){this.$backdrop.removeClass('in');$('body').off('touchmove.bs');var self=this;if($.support.transition){this.$backdrop.one($.support.transition.end,function(){self.$backdrop.remove();callback()\nself.$backdrop=null;}).emulateTransitionEnd(150);}else{this.$backdrop.remove();this.$backdrop=null;callback();}}else if(callback){callback()}}\nOffCanvas.prototype.calcClone=function(){this.$calcClone=this.$element.clone().html('').addClass('offcanvas-clone').removeClass('in').appendTo($('body'))}\nOffCanvas.prototype.recalc=function(){if(this.$calcClone.css('display')==='none'||(this.state!=='slid'&&this.state!=='slide-in'))return\nthis.state=null\nthis.placement=null\nvar elements=this.getCanvasElements()\nthis.$element.removeClass('in')\nelements.removeClass('canvas-slid')\nelements.add(this.$element).add('body').each(function(){$(this).attr('style',$(this).data('offcanvas-style')).removeData('offcanvas-style')})}\nOffCanvas.prototype.autohide=function(e){if($(e.target).closest(this.$element).length===0)this.hide()}\nvar old=$.fn.offcanvas\n$.fn.offcanvas=function(option){return this.each(function(){var $this=$(this)\nvar data=$this.data('bs.offcanvas')\nvar options=$.extend({},OffCanvas.DEFAULTS,$this.data(),typeof option==='object'&&option)\nif(!data)$this.data('bs.offcanvas',(data=new OffCanvas(this,options)))\nif(typeof option==='string')data[option]()})}\n$.fn.offcanvas.Constructor=OffCanvas\n$.fn.offcanvas.noConflict=function(){$.fn.offcanvas=old\nreturn this}\n$(document).on('click.bs.offcanvas.data-api','[data-toggle=offcanvas]',function(e){var $this=$(this),href\nvar target=$this.attr('data-target')||e.preventDefault()||(href=$this.attr('href'))&&href.replace(/.*(?=#[^\\s]+$)/,'')\nvar $canvas=$(target)\nvar data=$canvas.data('bs.offcanvas')\nvar option=data?'toggle':$this.data()\ne.stopPropagation()\nif(data)data.toggle()\nelse $canvas.offcanvas(option)})}(window.jQuery);+function($){\"use strict\";var Rowlink=function(element,options){this.$element=$(element)\nthis.options=$.extend({},Rowlink.DEFAULTS,options)\nthis.$element.on('click.bs.rowlink','td:not(.rowlink-skip)',$.proxy(this.click,this))}\nRowlink.DEFAULTS={target:\"a\"}\nRowlink.prototype.click=function(e){var target=$(e.currentTarget).closest('tr').find(this.options.target)[0]\nif($(e.target)[0]===target)return\ne.preventDefault();if(target.click){target.click()}else if(document.createEvent){var evt=document.createEvent(\"MouseEvents\");evt.initMouseEvent(\"click\",true,true,window,0,0,0,0,0,false,false,false,false,0,null);target.dispatchEvent(evt);}}\nvar old=$.fn.rowlink\n$.fn.rowlink=function(options){return this.each(function(){var $this=$(this)\nvar data=$this.data('bs.rowlink')\nif(!data)$this.data('bs.rowlink',(data=new Rowlink(this,options)))})}\n$.fn.rowlink.Constructor=Rowlink\n$.fn.rowlink.noConflict=function(){$.fn.rowlink=old\nreturn this}\n$(document).on('click.bs.rowlink.data-api','[data-link=\"row\"]',function(e){if($(e.target).closest('.rowlink-skip').length!==0)return\nvar $this=$(this)\nif($this.data('bs.rowlink'))return\n$this.rowlink($this.data())\n$(e.target).trigger('click.bs.rowlink')})}(window.jQuery);+function($){\"use strict\";var isIphone=(window.orientation!==undefined)\nvar isAndroid=navigator.userAgent.toLowerCase().indexOf(\"android\")>-1\nvar isIE=window.navigator.appName=='Microsoft Internet Explorer'\nvar Inputmask=function(element,options){if(isAndroid)return\nthis.$element=$(element)\nthis.options=$.extend({},Inputmask.DEFAULTS,options)\nthis.mask=String(this.options.mask)\nthis.init()\nthis.listen()\nthis.checkVal()}\nInputmask.DEFAULTS={mask:\"\",placeholder:\"_\",definitions:{'9':\"[0-9]\",'a':\"[A-Za-z]\",'w':\"[A-Za-z0-9]\",'*':\".\"}}\nInputmask.prototype.init=function(){var defs=this.options.definitions\nvar len=this.mask.length\nthis.tests=[]\nthis.partialPosition=this.mask.length\nthis.firstNonMaskPos=null\n$.each(this.mask.split(\"\"),$.proxy(function(i,c){if(c=='?'){len--\nthis.partialPosition=i}else if(defs[c]){this.tests.push(new RegExp(defs[c]))\nif(this.firstNonMaskPos===null)this.firstNonMaskPos=this.tests.length-1}else{this.tests.push(null)}},this))\nthis.buffer=$.map(this.mask.split(\"\"),$.proxy(function(c,i){if(c!='?')return defs[c]?this.options.placeholder:c},this))\nthis.focusText=this.$element.val()\nthis.$element.data(\"rawMaskFn\",$.proxy(function(){return $.map(this.buffer,function(c,i){return this.tests[i]&&c!=this.options.placeholder?c:null}).join('')},this))}\nInputmask.prototype.listen=function(){if(this.$element.attr(\"readonly\"))return\nvar pasteEventName=(isIE?'paste':'input')+\".bs.inputmask\"\nthis.$element.on(\"unmask.bs.inputmask\",$.proxy(this.unmask,this)).on(\"focus.bs.inputmask\",$.proxy(this.focusEvent,this)).on(\"blur.bs.inputmask\",$.proxy(this.blurEvent,this)).on(\"keydown.bs.inputmask\",$.proxy(this.keydownEvent,this)).on(\"keypress.bs.inputmask\",$.proxy(this.keypressEvent,this)).on(pasteEventName,$.proxy(this.pasteEvent,this))}\nInputmask.prototype.caret=function(begin,end){if(this.$element.length===0)return\nif(typeof begin=='number'){end=(typeof end=='number')?end:begin\nreturn this.$element.each(function(){if(this.setSelectionRange){this.setSelectionRange(begin,end)}else if(this.createTextRange){var range=this.createTextRange()\nrange.collapse(true)\nrange.moveEnd('character',end)\nrange.moveStart('character',begin)\nrange.select()}})}else{if(this.$element[0].setSelectionRange){begin=this.$element[0].selectionStart\nend=this.$element[0].selectionEnd}else if(document.selection&&document.selection.createRange){var range=document.selection.createRange()\nbegin=0-range.duplicate().moveStart('character',-100000)\nend=begin+range.text.length}return{begin:begin,end:end}}}\nInputmask.prototype.seekNext=function(pos){var len=this.mask.length\nwhile(++pos<=len&&!this.tests[pos]);return pos}\nInputmask.prototype.seekPrev=function(pos){while(--pos>=0&&!this.tests[pos]);return pos}\nInputmask.prototype.shiftL=function(begin,end){var len=this.mask.length\nif(begin<0)return\nfor(var i=begin,j=this.seekNext(end);i<len;i++){if(this.tests[i]){if(j<len&&this.tests[i].test(this.buffer[j])){this.buffer[i]=this.buffer[j]\nthis.buffer[j]=this.options.placeholder}else\nbreak\nj=this.seekNext(j)}}this.writeBuffer()\nthis.caret(Math.max(this.firstNonMaskPos,begin))}\nInputmask.prototype.shiftR=function(pos){var len=this.mask.length\nfor(var i=pos,c=this.options.placeholder;i<len;i++){if(this.tests[i]){var j=this.seekNext(i)\nvar t=this.buffer[i]\nthis.buffer[i]=c\nif(j<len&&this.tests[j].test(t))c=t\nelse\nbreak}}},Inputmask.prototype.unmask=function(){this.$element.unbind(\".bs.inputmask\").removeData(\"bs.inputmask\")}\nInputmask.prototype.focusEvent=function(){this.focusText=this.$element.val()\nvar len=this.mask.length\nvar pos=this.checkVal()\nthis.writeBuffer()\nvar that=this\nvar moveCaret=function(){if(pos==len)that.caret(0,pos)\nelse\nthat.caret(pos)}\nmoveCaret()\nsetTimeout(moveCaret,50)}\nInputmask.prototype.blurEvent=function(){this.checkVal()\nif(this.$element.val()!==this.focusText){this.$element.trigger('change')\nthis.$element.trigger('input')}}\nInputmask.prototype.keydownEvent=function(e){var k=e.which\nif(k==8||k==46||(isIphone&&k==127)){var pos=this.caret(),begin=pos.begin,end=pos.end\nif(end-begin===0){begin=k!=46?this.seekPrev(begin):(end=this.seekNext(begin-1))\nend=k==46?this.seekNext(end):end}this.clearBuffer(begin,end)\nthis.shiftL(begin,end-1)\nreturn false}else if(k==27){this.$element.val(this.focusText)\nthis.caret(0,this.checkVal())\nreturn false}}\nInputmask.prototype.keypressEvent=function(e){var len=this.mask.length\nvar k=e.which,pos=this.caret()\nif(e.ctrlKey||e.altKey||e.metaKey||k<32){return true}else if(k){if(pos.end-pos.begin!==0){this.clearBuffer(pos.begin,pos.end)\nthis.shiftL(pos.begin,pos.end-1)}var p=this.seekNext(pos.begin-1)\nif(p<len){var c=String.fromCharCode(k)\nif(this.tests[p].test(c)){this.shiftR(p)\nthis.buffer[p]=c\nthis.writeBuffer()\nvar next=this.seekNext(p)\nthis.caret(next)}}return false}}\nInputmask.prototype.pasteEvent=function(){var that=this\nsetTimeout(function(){that.caret(that.checkVal(true))},0)}\nInputmask.prototype.clearBuffer=function(start,end){var len=this.mask.length\nfor(var i=start;i<end&&i<len;i++){if(this.tests[i])this.buffer[i]=this.options.placeholder}}\nInputmask.prototype.writeBuffer=function(){return this.$element.val(this.buffer.join('')).val()}\nInputmask.prototype.checkVal=function(allow){var len=this.mask.length\nvar test=this.$element.val()\nvar lastMatch=-1\nfor(var i=0,pos=0;i<len;i++){if(this.tests[i]){this.buffer[i]=this.options.placeholder\nwhile(pos++<test.length){var c=test.charAt(pos-1)\nif(this.tests[i].test(c)){this.buffer[i]=c\nlastMatch=i\nbreak}}if(pos>test.length)break}else if(this.buffer[i]==test.charAt(pos)&&i!=this.partialPosition){pos++\nlastMatch=i}}if(!allow&&lastMatch+1<this.partialPosition){this.$element.val(\"\")\nthis.clearBuffer(0,len)}else if(allow||lastMatch+1>=this.partialPosition){this.writeBuffer()\nif(!allow)this.$element.val(this.$element.val().substring(0,lastMatch+1))}return(this.partialPosition?i:this.firstNonMaskPos)}\nvar old=$.fn.inputmask\n$.fn.inputmask=function(options){return this.each(function(){var $this=$(this)\nvar data=$this.data('bs.inputmask')\nif(!data)$this.data('bs.inputmask',(data=new Inputmask(this,options)))})}\n$.fn.inputmask.Constructor=Inputmask\n$.fn.inputmask.noConflict=function(){$.fn.inputmask=old\nreturn this}\n$(document).on('focus.bs.inputmask.data-api','[data-mask]',function(e){var $this=$(this)\nif($this.data('bs.inputmask'))return\n$this.inputmask($this.data())})}(window.jQuery);+function($){\"use strict\";var isIE=window.navigator.appName=='Microsoft Internet Explorer'\nvar Fileinput=function(element,options){this.$element=$(element)\nthis.$input=this.$element.find(':file')\nif(this.$input.length===0)return\nthis.name=this.$input.attr('name')||options.name\nthis.$hidden=this.$element.find('input[type=hidden][name=\"'+this.name+'\"]')\nif(this.$hidden.length===0){this.$hidden=$('<input type=\"hidden\">').insertBefore(this.$input)}this.$preview=this.$element.find('.fileinput-preview')\nvar height=this.$preview.css('height')\nif(this.$preview.css('display')!=='inline'&&height!=='0px'&&height!=='none'){this.$preview.css('line-height',height)}this.original={exists:this.$element.hasClass('fileinput-exists'),preview:this.$preview.html(),hiddenVal:this.$hidden.val()}\nthis.listen()}\nFileinput.prototype.listen=function(){this.$input.on('change.bs.fileinput',$.proxy(this.change,this))\n$(this.$input[0].form).on('reset.bs.fileinput',$.proxy(this.reset,this))\nthis.$element.find('[data-trigger=\"fileinput\"]').on('click.bs.fileinput',$.proxy(this.trigger,this))\nthis.$element.find('[data-dismiss=\"fileinput\"]').on('click.bs.fileinput',$.proxy(this.clear,this))},Fileinput.prototype.change=function(e){var files=e.target.files===undefined?(e.target&&e.target.value?[{name:e.target.value.replace(/^.+\\\\/,'')}]:[]):e.target.files\ne.stopPropagation()\nif(files.length===0){this.clear()\nreturn}this.$hidden.val('')\nthis.$hidden.attr('name','')\nthis.$input.attr('name',this.name)\nvar file=files[0]\nif(this.$preview.length>0&&(typeof file.type!==\"undefined\"?file.type.match(/^image\\/(gif|png|jpeg)$/):file.name.match(/\\.(gif|png|jpe?g)$/i))&&typeof FileReader!==\"undefined\"){var reader=new FileReader()\nvar preview=this.$preview\nvar element=this.$element\nreader.onload=function(re){var $img=$('<img>')\n$img[0].src=re.target.result\nfiles[0].result=re.target.result\nelement.find('.fileinput-filename').text(file.name)\nif(preview.css('max-height')!='none')$img.css('max-height',parseInt(preview.css('max-height'),10)-parseInt(preview.css('padding-top'),10)-parseInt(preview.css('padding-bottom'),10)-parseInt(preview.css('border-top'),10)-parseInt(preview.css('border-bottom'),10))\npreview.html($img)\nelement.addClass('fileinput-exists').removeClass('fileinput-new')\nelement.trigger('change.bs.fileinput',files)}\nreader.readAsDataURL(file)}else{this.$element.find('.fileinput-filename').text(file.name)\nthis.$preview.text(file.name)\nthis.$element.addClass('fileinput-exists').removeClass('fileinput-new')\nthis.$element.trigger('change.bs.fileinput')}},Fileinput.prototype.clear=function(e){if(e)e.preventDefault()\nthis.$hidden.val('')\nthis.$hidden.attr('name',this.name)\nthis.$input.attr('name','')\nif(isIE){var inputClone=this.$input.clone(true);this.$input.after(inputClone);this.$input.remove();this.$input=inputClone;}else{this.$input.val('')}this.$preview.html('')\nthis.$element.find('.fileinput-filename').text('')\nthis.$element.addClass('fileinput-new').removeClass('fileinput-exists')\nif(e!==undefined){this.$input.trigger('change')\nthis.$element.trigger('clear.bs.fileinput')}},Fileinput.prototype.reset=function(){this.clear()\nthis.$hidden.val(this.original.hiddenVal)\nthis.$preview.html(this.original.preview)\nthis.$element.find('.fileinput-filename').text('')\nif(this.original.exists)this.$element.addClass('fileinput-exists').removeClass('fileinput-new')\nelse this.$element.addClass('fileinput-new').removeClass('fileinput-exists')\nthis.$element.trigger('reset.bs.fileinput')},Fileinput.prototype.trigger=function(e){this.$input.trigger('click')\ne.preventDefault()}\nvar old=$.fn.fileinput\n$.fn.fileinput=function(options){return this.each(function(){var $this=$(this),data=$this.data('bs.fileinput')\nif(!data)$this.data('bs.fileinput',(data=new Fileinput(this,options)))\nif(typeof options=='string')data[options]()})}\n$.fn.fileinput.Constructor=Fileinput\n$.fn.fileinput.noConflict=function(){$.fn.fileinput=old\nreturn this}\n$(document).on('click.fileinput.data-api','[data-provides=\"fileinput\"]',function(e){var $this=$(this)\nif($this.data('bs.fileinput'))return\n$this.fileinput($this.data())\nvar $target=$(e.target).closest('[data-dismiss=\"fileinput\"],[data-trigger=\"fileinput\"]');if($target.length>0){e.preventDefault()\n$target.trigger('click.bs.fileinput')}})}(window.jQuery);";
var mod_pagespeed_mIr0nkzB88 = ";(function($){var bootstrapWizardCreate=function(element,options){var element=$(element);var obj=this;var baseItemSelector='li:has([data-toggle=\"tab\"])';var historyStack=[];var $settings=$.extend({},$.fn.bootstrapWizard.defaults,options);var $activeTab=null;var $navigation=null;this.rebindClick=function(selector,fn){selector.unbind('click',fn).bind('click',fn);}\nthis.fixNavigationButtons=function(){if(!$activeTab.length){$navigation.find('a:first').tab('show');$activeTab=$navigation.find(baseItemSelector+':first');}$($settings.previousSelector,element).toggleClass('disabled',(obj.firstIndex()>=obj.currentIndex()));$($settings.nextSelector,element).toggleClass('disabled',(obj.currentIndex()>=obj.navigationLength()));$($settings.nextSelector,element).toggleClass('hidden',(obj.currentIndex()>=obj.navigationLength()&&$($settings.finishSelector,element).length>0));$($settings.lastSelector,element).toggleClass('hidden',(obj.currentIndex()>=obj.navigationLength()&&$($settings.finishSelector,element).length>0));$($settings.finishSelector,element).toggleClass('hidden',(obj.currentIndex()<obj.navigationLength()));$($settings.backSelector,element).toggleClass('disabled',(historyStack.length==0));$($settings.backSelector,element).toggleClass('hidden',(obj.currentIndex()>=obj.navigationLength()&&$($settings.finishSelector,element).length>0));obj.rebindClick($($settings.nextSelector,element),obj.next);obj.rebindClick($($settings.previousSelector,element),obj.previous);obj.rebindClick($($settings.lastSelector,element),obj.last);obj.rebindClick($($settings.firstSelector,element),obj.first);obj.rebindClick($($settings.finishSelector,element),obj.finish);obj.rebindClick($($settings.backSelector,element),obj.back);if($settings.onTabShow&&typeof $settings.onTabShow==='function'&&$settings.onTabShow($activeTab,$navigation,obj.currentIndex())===false){return false;}};this.next=function(e){if(element.hasClass('last')){return false;}if($settings.onNext&&typeof $settings.onNext==='function'&&$settings.onNext($activeTab,$navigation,obj.nextIndex())===false){return false;}var formerIndex=obj.currentIndex();var $index=obj.nextIndex();if($index>obj.navigationLength()){}else{historyStack.push(formerIndex);$navigation.find(baseItemSelector+($settings.withVisible?':visible':'')+':eq('+$index+') a').tab('show');}};this.previous=function(e){if(element.hasClass('first')){return false;}if($settings.onPrevious&&typeof $settings.onPrevious==='function'&&$settings.onPrevious($activeTab,$navigation,obj.previousIndex())===false){return false;}var formerIndex=obj.currentIndex();var $index=obj.previousIndex();if($index<0){}else{historyStack.push(formerIndex);$navigation.find(baseItemSelector+($settings.withVisible?':visible':'')+':eq('+$index+') a').tab('show');}};this.first=function(e){if($settings.onFirst&&typeof $settings.onFirst==='function'&&$settings.onFirst($activeTab,$navigation,obj.firstIndex())===false){return false;}if(element.hasClass('disabled')){return false;}historyStack.push(obj.currentIndex());$navigation.find(baseItemSelector+':eq(0) a').tab('show');};this.last=function(e){if($settings.onLast&&typeof $settings.onLast==='function'&&$settings.onLast($activeTab,$navigation,obj.lastIndex())===false){return false;}if(element.hasClass('disabled')){return false;}historyStack.push(obj.currentIndex());$navigation.find(baseItemSelector+':eq('+obj.navigationLength()+') a').tab('show');};this.finish=function(e){if($settings.onFinish&&typeof $settings.onFinish==='function'){$settings.onFinish($activeTab,$navigation,obj.lastIndex());}};this.back=function(){if(historyStack.length==0){return null;}var formerIndex=historyStack.pop();if($settings.onBack&&typeof $settings.onBack==='function'&&$settings.onBack($activeTab,$navigation,formerIndex)===false){historyStack.push(formerIndex);return false;}element.find(baseItemSelector+':eq('+formerIndex+') a').tab('show');};this.currentIndex=function(){return $navigation.find(baseItemSelector).index($activeTab);};this.firstIndex=function(){return 0;};this.lastIndex=function(){return obj.navigationLength();};this.getIndex=function(e){return $navigation.find(baseItemSelector).index(e);};this.nextIndex=function(){return $navigation.find(baseItemSelector).index($activeTab)+1;};this.previousIndex=function(){return $navigation.find(baseItemSelector).index($activeTab)-1;};this.navigationLength=function(){return $navigation.find(baseItemSelector).length-1;};this.activeTab=function(){return $activeTab;};this.nextTab=function(){return $navigation.find(baseItemSelector+':eq('+(obj.currentIndex()+1)+')').length?$navigation.find(baseItemSelector+':eq('+(obj.currentIndex()+1)+')'):null;};this.previousTab=function(){if(obj.currentIndex()<=0){return null;}return $navigation.find(baseItemSelector+':eq('+parseInt(obj.currentIndex()-1)+')');};this.show=function(index){var tabToShow=isNaN(index)?element.find(baseItemSelector+' a[href=#'+index+']'):element.find(baseItemSelector+':eq('+index+') a');if(tabToShow.length>0){historyStack.push(obj.currentIndex());tabToShow.tab('show');}};this.disable=function(index){$navigation.find(baseItemSelector+':eq('+index+')').addClass('disabled');};this.enable=function(index){$navigation.find(baseItemSelector+':eq('+index+')').removeClass('disabled');};this.hide=function(index){$navigation.find(baseItemSelector+':eq('+index+')').hide();};this.display=function(index){$navigation.find(baseItemSelector+':eq('+index+')').show();};this.remove=function(args){var $index=args[0];var $removeTabPane=typeof args[1]!='undefined'?args[1]:false;var $item=$navigation.find(baseItemSelector+':eq('+$index+')');if($removeTabPane){var $href=$item.find('a').attr('href');$($href).remove();}$item.remove();};var innerTabClick=function(e){var $ul=$navigation.find(baseItemSelector);var clickedIndex=$ul.index($(e.currentTarget).parent(baseItemSelector));var $clickedTab=$($ul[clickedIndex]);if($settings.onTabClick&&typeof $settings.onTabClick==='function'&&$settings.onTabClick($activeTab,$navigation,obj.currentIndex(),clickedIndex,$clickedTab)===false){return false;}};var innerTabShown=function(e){var $element=$(e.target).parent();var nextTab=$navigation.find(baseItemSelector).index($element);if($element.hasClass('disabled')){return false;}if($settings.onTabChange&&typeof $settings.onTabChange==='function'&&$settings.onTabChange($activeTab,$navigation,obj.currentIndex(),nextTab)===false){return false;}$activeTab=$element;obj.fixNavigationButtons();};this.resetWizard=function(){$('a[data-toggle=\"tab\"]',$navigation).off('click',innerTabClick);$('a[data-toggle=\"tab\"]',$navigation).off('shown shown.bs.tab',innerTabShown);$navigation=element.find('ul:first',element);$activeTab=$navigation.find(baseItemSelector+'.active',element);$('a[data-toggle=\"tab\"]',$navigation).on('click',innerTabClick);$('a[data-toggle=\"tab\"]',$navigation).on('shown shown.bs.tab',innerTabShown);obj.fixNavigationButtons();};$navigation=element.find('ul:first',element);$activeTab=$navigation.find(baseItemSelector+'.active',element);if(!$navigation.hasClass($settings.tabClass)){$navigation.addClass($settings.tabClass);}if($settings.onInit&&typeof $settings.onInit==='function'){$settings.onInit($activeTab,$navigation,0);}if($settings.onShow&&typeof $settings.onShow==='function'){$settings.onShow($activeTab,$navigation,obj.nextIndex());}$('a[data-toggle=\"tab\"]',$navigation).on('click',innerTabClick);$('a[data-toggle=\"tab\"]',$navigation).on('shown shown.bs.tab',innerTabShown);};$.fn.bootstrapWizard=function(options){if(typeof options=='string'){var args=Array.prototype.slice.call(arguments,1)\nif(args.length===1){args.toString();}return this.data('bootstrapWizard')[options](args);}return this.each(function(index){var element=$(this);if(element.data('bootstrapWizard'))return;var wizard=new bootstrapWizardCreate(element,options);element.data('bootstrapWizard',wizard);wizard.fixNavigationButtons();});};$.fn.bootstrapWizard.defaults={withVisible:true,tabClass:'nav nav-pills',nextSelector:'.wizard li.next',previousSelector:'.wizard li.previous',firstSelector:'.wizard li.first',lastSelector:'.wizard li.last',finishSelector:'.wizard li.finish',backSelector:'.wizard li.back',onShow:null,onInit:null,onNext:null,onPrevious:null,onLast:null,onFirst:null,onFinish:null,onBack:null,onTabChange:null,onTabClick:null,onTabShow:null};})(jQuery);";
