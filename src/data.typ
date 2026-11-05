
// Dans ce fichier sont écrits en dur les informations de mise en page. Il faut
// trouvé une manière pour que ces informations soit passé par l’utilisateur.

#let second-marge = state("second-marge", 
    (top: 1.5cm, inside:1cm, bottom: 1.5cm, outside:1cm)
)

// #let second-marge = state("main-marge", (
//   odd: (top: 1.5cm, left: 0cm, bottom: 1.5cm, right: 1cm),
//   even: (top: 1.5cm, left: 1cm, bottom: 1.5cm, right: 0cm),
// ))


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



#let get-main-side-marge() = {
    (page.margin.left, page.margin.right)
}

#let get-second-side-marge() = {
    (second-marge.get().outside, second-marge.get().outside)
}

#let get_outside() =  {
    if type(page.margin) != dictionary {
        page.margin
    } else if page.margin.keys().contains("outside"){
        page.margin.outside
    } else if page.margin.keys().contains("x"){
        page.margin.x
    } else if page.margin.keys().contains("right") and page.margin.keys().contains("left") {
        if page.margin.right == page.margin.left {
            page.margin.right
        } else {
            panic("Bookpositing::get_outisde() -> impossible de déterminer la valeur outside pensé a définir le parametre \"page.margin.outside\" ou que les page.margin.right et page.margin.left soit egaux:
           https://typst.app/docs/reference/layout/page/#parameters-margin " )
        }
    }
}

#let get_inside() = {
    if type(page.margin) != dictionary {
        page.margin
    }
    if page.margin.keys().contains("inside"){
        page.margin.inside
    }
    if page.margin.keys().contains("x"){
        page.margin.x
    }
    if page.margin.keys().contains("right") and page.margin.keys().contains("left") {
        if page.margin.right == page.margin.left {
            page.margin.right
        } else {
            panic("Bookpositing::get_outisde() -> impossible de déterminer la valeur inside pensé a définir le parametre \"page.margin.inside\" ou que les page.margin.right et page.margin.left soit egaux
https://typst.app/docs/reference/layout/page/#parameters-margin
" )
        }
    }

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
