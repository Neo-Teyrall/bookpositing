

#import "../src/lib.typ"
#import "/Utils/bg.typ"
#import "/Utils/projets.typ"

#show : projets.setup
#show : lib.contour
#show : bg.default


#set par(justify:true)

#lib.composing(4,debug:false, {
        lib.content([
        == emarged note

        #lorem(2100)] 
    )
    lib.comment(placement: bottom+right, even:true, lorem(50))
    lib.comment(page:1,placement: bottom+left, even:false, lorem(50))

    lib.comment(page:2,placement: top+left, even:true, lorem(50))
    lib.comment(page:3,placement: bottom+right, even:false, lorem(50))

})
