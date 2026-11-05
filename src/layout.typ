
#import "@preview/meander:0.4.4"

// Les différent mise en page en fonction des type d’image utiliser
// un layout créer des conteneur de texte adapter aux images en fonction de leur type de page.

#let base-layout() = {
    meander.container(
        width: 50% - 3mm,
        margin: 6mm,
    )
    meander.container(
        dx: 52%,
        width: 50% - 3mm,
    margin: 6mm,
    )
}


#let layout-2-3(is-even) = {
    if is-even {
        meander.container(
            width: 50% - 3mm,
            margin: 6mm,
        )
        meander.container(
            dx: 50%,
            width: 50% - 3mm,
            margin: 6mm,
        )
    } else {
        meander.container(
            dx: 25%,
            width: 40% - 3mm,
            margin: 6mm,
        )
        meander.container(
            dx: 67%,
            width: 40% - 3mm,
            margin: 6mm,
        )
    }
}


#let layout-2-3-right(is-even) = {
    if is-even {
    meander.container(
      dx: -4%,
      width: 40% - 3mm,
      margin: 3mm,
    )
    meander.container(
      dx: 37%,
      width: 40% - 3mm,
      margin: 3mm,
    )
  } else {
    meander.container(
      width: 50% - 3mm,
      margin: 3mm,
    )
    meander.container(
      dx: 50%,
      width: 50% - 3mm,
      margin: 3mm,
    )
  }
}



#let layout-1-3-right(is-even) = {
  if not is-even  {
    meander.container(
      dx: 55%,
      width: 47%,
      margin: 6mm,
    )
  } else {
    meander.container(
      dx: -5%,
      width: 45% - 3mm,
      margin: 6mm,
    )
    meander.container(
      width: 85%,
      margin: 6mm,
    )
  }
}
 
#let layout-1-3(is-even) = {
  if not is-even {
    meander.container(
      dx: 15%,
      width: 45% - 3mm,
        height: 100%,
      margin: 6mm,
    )
    meander.container(
      dx: 15%,
      width: 90%,
        height: 100%,
    )
  } else {
    meander.container(
      width: 45%,
        height: 100%,
      margin: 6mm,
    )
  }
}


#let layout-enmarge-left(is-even) = {
  if is-even {
    meander.container(
      dx: -5%,
      width: 40%,
      height: 100%,
      margin: 6mm,
    )
    meander.container(
      dx: 40%,
      width: 40%,
      height: 100%,
    )
  } else {
    meander.container(
      dx: 0%,
      width: 38%,
      height: 100%,
      margin: 6mm,
    )
    meander.container(
      dx: 41%,
      width: 38%,
      height: 100%,
        margin: 6mm,
    )
  }
}


#let layout-enmarge-right(is-even) = {
  if is-even {
    meander.container(
      dx: 20%,
      width: 36%,
      height: 100%,
      margin: 6mm,
    )
    meander.container(
      dx: 60%,
      width: 36%,
      height: 100%,
    )
  } else {
    meander.container(
      dx: 20%,
      width: 40%,
      height: 100%,
      margin: 6mm,
    )
    meander.container(
      dx: 60%,
      width: 40%,
      height: 100%,
    )
  }
}

