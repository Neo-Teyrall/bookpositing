#import "/src/bookpositing.typ"

#bookpositing.composing(2, {

    bookpositing.layout-header(page:0,[
        == 1/3 

        #lorem(150)]
    )
    bookpositing.content([

        #lorem(750)]
    )
    bookpositing.page-image.left-1-3(page:0,
        marge: "main",
        bookpositing.default-image)
    
})

#bookpositing.composing(2, {

    bookpositing.layout-header(page:0,[
        == 1/3 

        #lorem(150)]
    )
    bookpositing.content([
        //== 1/3

        #lorem(750)]
    )
    bookpositing.page-image.left-1-3(page:0,
        marge: "second",
        bookpositing.default-image)
    
})


#bookpositing.composing(2, {

    bookpositing.layout-header(page:0,[
        == 1/3 

        #lorem(150)]
    )
    bookpositing.content([
        //== 1/3

        #lorem(750)]
    )
    bookpositing.page-image.left-1-3(page:0,
        marge: "none",
        bookpositing.default-image)
})
