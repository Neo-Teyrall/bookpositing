
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
        let current-marge = second-marge.get()
        if type(inside) == length{
            current-marge.inside = inside
        }
        if type(outside) == length{
            current-marge.outside = outside
        }
        if type(top) == length{
            current-marge.top = top
        }
        if type(bottom) == length{
            current-marge.bottom = bottom
        }
        second-marge.update(current-marge)
}
