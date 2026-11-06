#import "@preview/meander:0.4.4"

#import "main-layout.typ"
#import "secondary-layout.typ"

#let no-x-placement(placement) = {
    if placement.y == none {
        bottom
    } else {
        placement.y
    }
}


#let get-x-placement(placement) = {
    if placement.x == none {
        right
    } else {
        placement.x
    }
}

#let get-y-placement(placement) = {
    if placement.y == none {
        bottom
    } else {
        placement.y
    }
}
#let large-1-3(placement,is-even,content) = {

    let placement = no-x-placement(placement)

    if is-even {
        meander.placed(
            dx:-2pt,
            placement ,
            boundary: meander.contour.margin(3mm),
            box(width: 46%, content))
    } else {
        meander.placed(
            dx:23pt, 
            placement + right,
            boundary: meander.contour.margin(3mm),
            box(width: 91%, content))
    }
}

#let large-1-3-right(placement,is-even,content) = {
    let placement = no-x-placement(placement)
    if is-even {
        meander.placed(
            dx:-25pt,
            placement + left,
            boundary: meander.contour.margin(3mm),
            box(width: 91%, content))
    } else {
           meander.placed(
            dx:10pt,
            placement + right,
            boundary: meander.contour.margin(3mm),
            box(width: 47%, content))
    }
}


#let large-2-3(placement,is-even,content) = {
    let placement = no-x-placement(placement)
    if is-even {
        meander.placed(
            dx:0pt,
            placement + left,
            boundary: meander.contour.margin(3mm),
            box(width: 100%, content))
    } else {
           meander.placed(
            dx: 40pt,
            placement + right,
            boundary: meander.contour.margin(3mm),
            box(width: 85%, content))
    }
}


#let large-2-3-right(placement,is-even,content) = {
    let placement = no-x-placement(placement)
    if is-even {
        meander.placed(
            dx: -20pt,
            placement ,
            boundary: meander.contour.margin(3mm),
            box(stroke:0pt,width: 79.5%, content))
        
    } else {
        meander.placed(
            dx:0pt,
            placement ,
            boundary: meander.contour.margin(3mm),
            box(width: 100%, content))
    }
}
#let large(page: 0, placement: bottom, content) = {
    let picture(current-layout,is-even) = {
        if current-layout == none{
            meander.placed(
                placement,
                boundary: meander.contour.margin(3mm),
                box(width: 100%, content))
        } else {
            if current-layout.layout ==  main-layout.layout-1-3 {
                large-1-3(placement,is-even,content) 
            } else if current-layout.layout ==  main-layout.layout-1-3-right {
                large-1-3-right(placement,is-even,content) 
            // } else if current-layout.layout ==  layout.layout-1-4 {
            //     placing-1-4(placement,is-even,content)
                 } else if current-layout.layout ==  main-layout.layout-2-3 {
               large-2-3(placement,is-even,content) 
            } else if current-layout.layout ==  main-layout.layout-2-3-right {
               large-2-3-right(placement,is-even,content) 
            } else {
                meander.placed(
                    placement,
                    boundary: meander.contour.margin(3mm),
                    box(width: 100%, content))
            }
        }
    }
        (
        (
            type: "text-image",
            page: page,
            content: picture,
            layout: none,
        ),
    )
}

#let short-1-3(placement,is-even,content) = {
    if is-even {
        let placement = no-x-placement(placement)
        meander.placed(
            dx:-2pt,
            placement ,
            boundary: meander.contour.margin(3mm),
            box(width: 46%, content))
    } else {
        let x = get-x-placement(placement)
        if x == right {
            meander.placed(
                dx:23pt,
                placement,
                boundary: meander.contour.margin(3mm),
                box(stroke:0pt,width: 43%, content))
        } else {
            meander.placed(
                dx:73pt,
                placement,
                boundary: meander.contour.margin(3mm),
                box(stroke:0pt,width: 43%, content))
        }
    }
}

#let short-1-3-right(placement,is-even,content) = {
    
    if is-even {
        let x = get-x-placement(placement)
        if x == right {
            meander.placed(
                dx:-73pt,
                placement,
                boundary: meander.contour.margin(3mm),
                box(stroke:0pt,width: 43%, content))
        } else {
            meander.placed(
                dx:-23pt,
                placement,
                boundary: meander.contour.margin(3mm),
                box(stroke:0pt,width: 43%, content))
        }
    } else {
        let placement = no-x-placement(placement)
           meander.placed(
            dx:10pt,
            placement + right,
            boundary: meander.contour.margin(3mm),
            box(width: 47%, content))
    }
}


#let short-2-3(placement,is-even,content) = {
    
    if is-even {
        meander.placed(
            placement,
            boundary: meander.contour.margin(3mm),
            box(width: 50%-3mm, content))
    } else {
        let x = get-x-placement(placement)
        let y = get-y-placement(placement)
        if x == left {
           meander.placed(
            dx: 120pt,
            placement,
            boundary: meander.contour.margin(3mm),
               box(stroke:0pt,width: 38.3%, content))
        }
        else {
               meander.placed(
            dx: 26pt,
            placement,
            boundary: meander.contour.margin(3mm),
                   box(stroke:0pt,width: 38.3%, content))
        }

        
    }
}


#let short-2-3-right(placement,is-even,content) = {

    if is-even {
                let x = get-x-placement(placement)
        let y = get-y-placement(placement)
        if x == left {
           meander.placed(
            dx: -20pt,
            placement,
            boundary: meander.contour.margin(3mm),
               box(stroke:0pt,width: 38.3%, content))
        }
        else {
               meander.placed(
            dx: -120pt,
            placement,
            boundary: meander.contour.margin(3mm),
                   box(stroke:0pt,width: 38.3%, content))
        }
    } else {
        meander.placed(
            placement,
            boundary: meander.contour.margin(3mm),
            box(width: 50%-3mm, content))
        
    }
}

#let short(page: 0, placement: bottom, content,) = {
    let picture(current-layout, is-even) = {
        if current-layout == none{
            meander.placed(
                placement,
                boundary: meander.contour.margin(3mm),
                box(stroke:0pt,width: 50%-3mm, content))
        } else {
            if current-layout.layout ==  main-layout.layout-1-3 {
                short-1-3(placement,is-even,content) 
            } else if current-layout.layout ==  main-layout.layout-1-3-right {
                short-1-3-right(placement,is-even,content) 
                // } else if current-layout.layout ==  layout.layout-1-4 {
                //     placing-1-4(placement,is-even,content)
            } else if current-layout.layout ==  main-layout.layout-2-3 {
                short-2-3(placement,is-even,content) 
            } else if current-layout.layout ==  main-layout.layout-2-3-right {
                short-2-3-right(placement,is-even,content) 
            } else {
                meander.placed(
                    placement,
                    boundary: meander.contour.margin(3mm),
                    box(width: 48%, content))
            }
        }
    }
    (
        (
            type: "text-image",
            page: page,
            content: picture,
            layout: none,
        ),
    )
}



#let free(page: 0, placement: bottom, content,) = {
    let picture(current-layout, is-even) = {
            meander.placed(
                placement,
                boundary: meander.contour.margin(3mm),
                box(stroke:0pt, content))

    }
    (
        (
            type: "text-image",
            page: page,
            content: picture,
            layout: none,
        ),
    )
}


