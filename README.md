A couple of experiments in using the FXSL (FP lib for XSLT) library by Dimitre Novatchev available at http://fxsl.sourceforge.net

# My explorations of how the library works

## different template call styles

You can use templates as 'functions' and call them by name.

    xmlstarlet tr by-name.xsl dummy.xml

But you can't dynamically choose the name of the template. ie. the *name* attribute of *call-template* must be known at compilation-time of the template. The alternative is to use *apply-templates* and influence the choice of template via the *select* at the call-site or the *match* on the template itself. The technique used in FXSL is to set the *match* to be something (a node-set) that is unique within the 'application' and then force that value to be used within the call-site *select*. The examples I've seen so far use a one-off xml node included in the XSLT doc itself such that the *select* discards the input node-set and selects that node while the template matches on that node.

In the example below I've created a unique node called 'foo' (which exists in namespace 'foo' so that it doesn't conflict with the default 'xsl' namespace). The *match* on my function template specifies that 'foo'. The *select* on the *apply-templates* discards the input node-set and instead passes my 'foo' by using *document('')* to instead access the DOM of the XSL file itself

    xmlstarlet tr by-match.xsl dummy.xml
