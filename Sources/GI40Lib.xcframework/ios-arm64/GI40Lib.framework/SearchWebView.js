// We're using a global variable to store the number of occurrences
var MyApp_SearchResultCount = 0;

var MyApp_Search_Current = 0;

// helper function, recursively searches in elements and their child nodes
function MyApp_HighlightAllOccurrencesOfStringForElement(element,keyword) {
    if (element) {
        if (element.nodeType == 3) {        // Text node
            while (true) {
                var value = element.nodeValue;  // Search for keyword in text node
                var idx = value.toLowerCase().indexOf(keyword);
                
                if (idx < 0) break;             // not found, abort
                
                var span = document.createElement("span");
                var text = document.createTextNode(value.substr(idx,keyword.length));
                span.appendChild(text);
                span.setAttribute("class","MyAppHighlight");
                span.style.backgroundColor="yellow";
                span.style.color="black";
                text = document.createTextNode(value.substr(idx+keyword.length));
                element.deleteData(idx, value.length - idx);
                var next = element.nextSibling;
                element.parentNode.insertBefore(span, next);
                element.parentNode.insertBefore(text, next);
                element = text;
                MyApp_SearchResultCount++;	// update the counter
            }
        } else if (element.nodeType == 1) { // Element node
            if (element.style.display != "none" && element.nodeName.toLowerCase() != 'select') {
                for (var i=element.childNodes.length-1; i>=0; i--) {
                    MyApp_HighlightAllOccurrencesOfStringForElement(element.childNodes[i],keyword);
                }
            }
        }
    }
}

// the main entry point to start the search
function MyApp_HighlightAllOccurrencesOfString(keyword) {
    MyApp_RemoveAllHighlights();
    MyApp_HighlightAllOccurrencesOfStringForElement(document.body, keyword.toLowerCase());
}

function MyApp_NextHighlight() {
    var element = document.getElementsByClassName("MyAppHighlight");
    
    if (MyApp_Search_Current < element.length) {
        if (MyApp_Search_Current-1 > 0) {
            element[MyApp_Search_Current-1].style.border="0px solid black";
        }
        element[MyApp_Search_Current].style.border="1px solid black";
        element[MyApp_Search_Current].scrollIntoView();
        MyApp_Search_Current++;
    } else {
        MyApp_Search_Current = 0;
    }
    
    return MyApp_Search_Current
}

function MyApp_NextHighlight_ret() {
    var element = document.getElementsByClassName("MyAppHighlight");
    
    if (MyApp_Search_Current < element.length) {
        if (MyApp_Search_Current-1 > 0) {
            element[MyApp_Search_Current-1].style.border="0px solid black";
        }
        element[MyApp_Search_Current].style.border="1px solid black";
        element[MyApp_Search_Current].scrollIntoView();
        MyApp_Search_Current++;
        return 0;
    } else {
        MyApp_Search_Current = 0;
        return 1;
    }
}

// helper function, recursively removes the highlights in elements and their childs
function MyApp_RemoveAllHighlightsForElement(element) {
    if (element) {
        if (element.nodeType == 1) {
            if (element.getAttribute("class") == "MyAppHighlight") {
                var text = element.removeChild(element.firstChild);
                element.parentNode.insertBefore(text,element);
                element.parentNode.removeChild(element);
                return true;
            } else {
                var normalize = false;
                for (var i=element.childNodes.length-1; i>=0; i--) {
                    if (MyApp_RemoveAllHighlightsForElement(element.childNodes[i])) {
                        normalize = true;
                    }
                }
                if (normalize) {
                    element.normalize();
                }
            }
        }
    }
    return false;
}

// the main entry point to remove the highlights
function MyApp_RemoveAllHighlights() {
    MyApp_SearchResultCount = 0;
    MyApp_RemoveAllHighlightsForElement(document.body);
}
