# utilisation
Ajouter le librairy au niveau de la racine de votre projets.

Importer dans votre fichier typst

``` typst
#import "/bookpositing/src/bookpositing.typ"

#show : bookpositing.contour


#bookpositing.composing(2, debug: true, {
    bookpositing.layout-header(page:0,[== full 2 page
        #lorem(100)]
    )
    bookpositing.page-image.full-2-2(page:0,
        over-marge: true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.content(lorem(300))

})



```


