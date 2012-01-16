// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

Element.addMethods({

    upcase: function(element) {
        if (!(element = $(element))) return;
        element.update(element.innerHTML.toUpperCase());
        return element;
    },
    
    toggleClassName: function(element, className) {
        if (!(element = $(element))) return;
        element.hasClassName(className) ? element.removeClassName(className) : element.addClassName(className);
        return element;
    }
});

    
    
