
// Dans ce fichier sont écrits en dur les informations de mise en page. Il faut
// trouvé une manière pour que ces informations soit passé par l’utilisateur.

// #let main-marge = state("main-marge", (
//     odd : (top:2.5cm, left:2cm, bottom:2.5cm, right:2cm),
//     even : (top:2.5cm, left:2cm, bottom:2.5cm, right:2cm)
// )
// )

#let second-marge = state("main-marge", (
    odd : (top:1.5cm, left:0cm, bottom:1.5cm, right:1cm),
    even : (top:1.5cm, left:1cm, bottom:1.5cm, right:0cm)
)
)

#let get-main-side-marge() = {
    (page.margin.left, page.margin.right)
}

#let get-second-side-marge() = {
    (second-marge.get().even.left, second-marge.get().odd.right)
}

#let get-text-region-width() = {
    page.width - page.margin.right - page.margin.left
}

#let get_page_layout() = {
    (height: (
        std.page.height
        - std.page.margin.top
        - std.page.margin.bottom
    ),
    width: (
        std.page.width
        - std.page.margin.right
        - std.page.margin.left
    ),)
}



#let contour(body) = {
    set std.page(bleed : 5mm,
       foreground: context{
        if calc.even(counter(std.page).get().first()) {
        [
            #place(
                top+left,
                dy : page.margin.top + std.page.bleed,
                line(length:100%,stroke: 2pt + blue))
            #place(
                bottom+left,
                dy : -(page.margin.bottom +std.page.bleed),
                line(length:100%,stroke:2pt + blue))
            #place(
                top+left,
                dx : page.margin.left + std.page.bleed,
                polygon(stroke:2pt + blue,(0pt,0pt),(0pt,100%)))
            #place(
                top+right,
                dx : -(page.margin.right + std.page.bleed),
                polygon(stroke:2pt + blue,(0pt,0pt),(0pt,100%)))

            #place(
                top+left,
                dy : second-marge.get().even.top+ std.page.bleed,
                line(length:100%,stroke: 2pt + purple))
            #place(
                bottom+left,
                dy : - (second-marge.get().even.bottom + std.page.bleed),
                line(length:100%,stroke:2pt + purple))
            #place(
                top+left,
                dx : second-marge.get().even.left + std.page.bleed,
                polygon(stroke:2pt + purple,(0pt,0pt),(0pt,100%)))
            #place(
                top+right,
                dx : -(second-marge.get().even.right + std.page.bleed),
                polygon(stroke:2pt + purple,(0pt,0pt),(0pt,100%)))


            #place(top+left,
                dy : std.page.bleed,
                line(length:100%,stroke: 2pt + gray))
            #place(bottom+left,
                dy : - (std.page.bleed),
                line(length:100%,stroke:2pt + gray))
            #place(top+left,
                dx : std.page.bleed,
                polygon(stroke:2pt + gray,(0pt,0pt),(0pt,100%)))
            #place(top+right,
                dx : -(std.page.bleed),
                polygon(stroke:2pt + gray,(0pt,0pt),(0pt,100%))
            )
            
        ]} else {[
            #place(top+left,
                dy : page.margin.top + std.page.bleed,
                line(length:100%,stroke: 2pt + blue))
            #place(bottom+left,
                dy : -(page.margin.bottom + std.page.bleed),
                line(length:100%,stroke:2pt + blue))
            #place(top+left,
                dx : page.margin.left + std.page.bleed,
                polygon(stroke:2pt + blue,(0pt,0pt),(0pt,100%)))
            #place(top+right,
                dx : -(page.margin.right + std.page.bleed),
                polygon(stroke:2pt + blue,(0pt,0pt),(0pt,100%)))
            
            #place(top+left,
                dy : second-marge.get().odd.top + std.page.bleed,
                line(length:100%,stroke: 2pt + purple))
            #place(bottom+left,
                dy : - (second-marge.get().odd.bottom + std.page.bleed),
                line(length:100%,stroke:2pt + purple))
            #place(top+left,
                dx : second-marge.get().odd.left  + std.page.bleed,
                polygon(stroke:2pt + purple,(0pt,0pt),(0pt,100%)))
            #place(top+right,
                dx : -(second-marge.get().odd.right + std.page.bleed),
                polygon(stroke:2pt + purple,(0pt,0pt),(0pt,100%)))
            

            #place(top+left,
                dy : std.page.bleed,
                line(length:100%,stroke: 2pt + gray))
            #place(bottom+left,
                dy : - (std.page.bleed),
                line(length:100%,stroke:2pt + gray))
            #place(top+left,
                dx : std.page.bleed,
                polygon(stroke:2pt + gray,(0pt,0pt),(0pt,100%)))
            #place(top+right,
                dx : -(std.page.bleed),
                polygon(stroke:2pt + gray,(0pt,0pt),(0pt,100%))
            )

        ]
        }
    },
        margin: (
            top:2.5cm,
            bottom:2.5cm,
            left:2cm,
            right:2cm),
        
    )
    body
}
