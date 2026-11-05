
// Dans ce fichier sont écrits en dur les informations de mise en page. Il faut
// trouvé une manière pour que ces informations soit passé par l’utilisateur.

#let main-marge = state("main-marge", (
    odd : (top:2.5cm, left:2cm, bottom:2.5cm, right:2cm),
    even : (top:2.5cm, left:2cm, bottom:2.5cm, right:2cm)
)
)

#let second-marge = state("main-marge", (
    odd : (top:1.5cm, left:0cm, bottom:1.5cm, right:1cm),
    even : (top:1.5cm, left:1cm, bottom:1.5cm, right:0cm)
)
)

// // distance entre la marge principale et la marge secondaire
// #let emarge = state("main-marge", (
//     odd : (top:1cm, left:2cm, bottom:1cm, right:1cm),
//     even : (top:1cm, left:1cm, bottom:1cm, right:2cm)
// )
// )

#let get-main-side-marge() = {
    (main-marge.get().even.left, main-marge.get().odd.right)
}

#let get-second-side-marge() = {
    (second-marge.get().even.left, second-marge.get().odd.right)
}
#let page = (
    width: 21cm,
    height: 29.7cm,
    margin: (top:2.5cm, left:2cm, bottom:2.5cm, right:2cm)
)

#let projets  =(
    data : (
        page: (
            width: 21cm,
            height: 29.7cm,
            margin: (top:2.5cm, left:2cm, bottom:2.5cm, right:2cm)
        )
    )
)

#let get-text-region-width() = {
    page.width - page.margin.right - page.margin.left
}
////////////////////////////////////////////////////////////////////////////////
///// marges
////////////////////////////////////////////////////////////////////////////////

// les marge de coté pour que les images de page ne mange pas sur les dessin de
// l’arrière plan.

#let side-marge = 12pt
#let topbot-marge = 37pt

#let emarge-full = (
  top: projets.data.page.margin.top - topbot-marge,
  bottom: projets.data.page.margin.bottom - topbot-marge,
  left: projets.data.page.margin.left - side-marge,
  right: projets.data.page.margin.right - side-marge,
)

#let page-layout = (
    height: (
        projets.data.page.height
        - projets.data.page.margin.top
        - projets.data.page.margin.bottom
    ),
    width: (
        projets.data.page.width
        - projets.data.page.margin.right
        - projets.data.page.margin.left
    ),
)

#let emarge-soft = (
  top: projets.data.page.margin.top - 37pt,
  bottom: projets.data.page.margin.bottom - 37pt,
  left: projets.data.page.margin.left - side-marge,
  right: projets.data.page.margin.right - side-marge,
)



#let contour(body) = {
    set std.page(bleed : 5mm,
       foreground: context{
        if calc.even(counter(std.page).get().first()) {
        [
            #place(
                top+left,
                dy : main-marge.get().even.top + std.page.bleed,
                line(length:100%,stroke: 2pt + blue))
            #place(
                bottom+left,
                dy : -(main-marge.get().even.bottom +std.page.bleed),
                line(length:100%,stroke:2pt + blue))
            #place(
                top+left,
                dx : main-marge.get().even.left + std.page.bleed,
                polygon(stroke:2pt + blue,(0pt,0pt),(0pt,100%)))
            #place(
                top+right,
                dx : -(main-marge.get().even.right + std.page.bleed),
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
                dy : main-marge.get().odd.top + std.page.bleed,
                line(length:100%,stroke: 2pt + blue))
            #place(bottom+left,
                dy : -(main-marge.get().odd.bottom + std.page.bleed),
                line(length:100%,stroke:2pt + blue))
            #place(top+left,
                dx : main-marge.get().odd.left + std.page.bleed,
                polygon(stroke:2pt + blue,(0pt,0pt),(0pt,100%)))
            #place(top+right,
                dx : -(main-marge.get().odd.right + std.page.bleed),
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
