

#import "../src/bookpositing.typ"
#show : bookpositing.marge-debug

#set par(justify:true)

#bookpositing.composing(4,debug:false, {
        bookpositing.content([
        == emarged note

        #lorem(2100)] 
    )
    bookpositing.comment(placement: bottom+right, even:true, lorem(50))
    bookpositing.comment(page:1,placement: bottom+left, even:false, lorem(50))

    bookpositing.comment(page:2,placement: top+left, even:true, lorem(50))
    bookpositing.comment(page:3,placement: bottom+right, even:false, lorem(50))

})
