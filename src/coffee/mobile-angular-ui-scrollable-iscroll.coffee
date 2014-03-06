angular.module("mobile-angular-ui.scrollable", [])

.run(['$document', ($document) -> 

  $document[0].addEventListener "touchmove", ((e) ->
    e.preventDefault()
  ), false

])

.directive "scrollable", ->
  replace: false
  restrict: "C"
  link: (scope, element, attr) ->
    setTimeout (->
      [].slice.call(document.querySelectorAll("input, select, button, textarea")).forEach (el) ->
        el.addEventListener (if ("ontouchstart" of window) then "touchstart" else "mousedown"), (e) ->
          e.stopPropagation()

      iscroll = new IScroll(element[0], {scrollbars: true, mouseWheel:true, checkDOMChanges: true})
    ), 200