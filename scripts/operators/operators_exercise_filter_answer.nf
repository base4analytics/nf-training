chr_ch = channel
  .of( 1..22, 'X', 'Y' )
  .filter( Number )
  .filter({ it % 2 == 0 })
  .view()
