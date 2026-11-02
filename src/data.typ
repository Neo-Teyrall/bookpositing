
// Dans ce fichier sont écrits en dur les informations de mise en page. Il faut
// trouvé une manière pour que ces informations soit passé par l’utilisateur.

#let projets  =(
    data : (
        page: (
            width: 21cm,
            height: 29.7cm,
            margin: (top:2.5cm, left:2cm, bottom:2.5cm, right:2cm)
        )
    )
)

#set page(
    width: projets.data.page.width,
    height: projets.data.page.height,
    margin: projets.data.page.margin,
)

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
    set page(background: [
        #place(top+left, dy : 2.5cm,line(length:100%,stroke:1pt))
        #place(bottom+left, dy : -2.5cm,line(length:100%,stroke:1pt))
        #place(top+left, dx : 2cm, polygon(stroke:1pt,(0pt,0pt),(0pt,100%)))
        #place(top+right, dx : -2cm, polygon(stroke:1pt,(0pt,0pt),(0pt,100%)))
                #place(top+left, dx : side-marge, polygon(stroke:1pt,(0pt,0pt),(0pt,100%)))
        #place(top+right, dx : - side-marge, polygon(stroke:1pt,(0pt,0pt),(0pt,100%)))
    ] )
    body
}
