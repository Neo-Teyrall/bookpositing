
// Dans ce fichier sont écrits en dur les informations de mise en page. Il faut
// trouvé une manière pour que ces informations soit passé par l’utilisateur.

#let second-marge = state("second-marge", 
    (top: 1.5cm, inside:1cm, bottom: 1.5cm, outside:1cm)
)


#let set_second-marge(
    inside: none,
    outside:none,
    top:none,
    bottom:none) = context {
        [call]
        let current-marge = second-marge.get()
        if type(inside) == length{
            current-marge.inside = inside
        }
        if type(outside) == length{
            [outside]
            current-marge.outside = outside
        }
        if type(top) == length{
            current-marge.top = top
        }
        if type(bottom) == length{
            current-marge.bottom = bottom
        }
        [#current-marge]
        second-marge.update(current-marge)
}

#let marge-debug(body) = {
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
                dy : second-marge.get().top+ std.page.bleed,
                line(length:100%,stroke: 2pt + purple))
            #place(
                bottom+left,
                dy : - (second-marge.get().bottom + std.page.bleed),
                line(length:100%,stroke:2pt + purple))
            #place(
                top+left,
                dx : second-marge.get().outside + std.page.bleed,
                polygon(stroke:2pt + purple,(0pt,0pt),(0pt,100%)))
            #place(
                top+right,
                dx : -(second-marge.get().outside + std.page.bleed),
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
                dy : second-marge.get().top + std.page.bleed,
                line(length:100%,stroke: 2pt + purple))
            #place(bottom+left,
                dy : - (second-marge.get().bottom + std.page.bleed),
                line(length:100%,stroke:2pt + purple))
            #place(top+left,
                dx : second-marge.get().outside  + std.page.bleed,
                polygon(stroke:2pt + purple,(0pt,0pt),(0pt,100%)))
            #place(top+right,
                dx : -(second-marge.get().outside + std.page.bleed),
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
