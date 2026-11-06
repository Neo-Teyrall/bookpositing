#import "/src/bookpositing.typ"

#set par(justify: true)
#bookpositing.data.set_second-marge(outside: 1cm)

#bookpositing.composing(14, debug: false, {
  bookpositing.content(lorem(6100))
  bookpositing.page-image.full-1-2(
    page: 0,
    bookpositing.default-image,
  )
  bookpositing.page-image.full-2-2(
    page: 2,
    bookpositing.default-image,
  )
  bookpositing.page-image.left-3-4(
    page: 4,
    bookpositing.default-image,
  )
  bookpositing.page-image.left-2-3(
    page: 6,
    bookpositing.default-image,
  )
  bookpositing.page-image.left-1-3(
    page: 8,
    bookpositing.default-image,
  )
  bookpositing.page-image.i1-4(
    page: 10,
    bookpositing.default-image,
  )
    bookpositing.page-image.centred(
    page: 12,
    bookpositing.default-image,
  )
})
