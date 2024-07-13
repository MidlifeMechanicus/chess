# Puts the current boardstate.

module ShowBoard
  def show_board
    a1 = board[0][0].display || "□"
    a2 = board[0][1].display || "■"
    a3 = board[0][2].display || "□"
    a4 = board[0][3].display || "■"
    a5 = board[0][4].display || "□"
    a6 = board[0][5].display || "■"
    a7 = board[0][6].display || "□"
    a8 = board[0][7].display || "■"
    b1 = board[1][0].display || "■"
    b2 = board[1][1].display || "□"
    b3 = board[1][2].display || "■"
    b4 = board[1][3].display || "□"
    b5 = board[1][4].display || "■"
    b6 = board[1][5].display || "□"
    b7 = board[1][6].display || "■"
    b8 = board[1][7].display || "□"
    c1 = board[2][0].display || "□"
    c2 = board[2][1].display || "■"
    c3 = board[2][2].display || "□"
    c4 = board[2][3].display || "■"
    c5 = board[2][4].display || "□"
    c6 = board[2][5].display || "■"
    c7 = board[2][6].display || "□"
    c8 = board[2][7].display || "■"
    d1 = board[3][0].display || "■"
    d2 = board[3][1].display || "□"
    d3 = board[3][2].display || "■"
    d4 = board[3][3].display || "□"
    d5 = board[3][4].display || "■"
    d6 = board[3][5].display || "□"
    d7 = board[3][6].display || "■"
    d8 = board[3][7].display || "□"
    e1 = board[4][0].display || "□"
    e2 = board[4][1].display || "■"
    e3 = board[4][2].display || "□"
    e4 = board[4][3].display || "■"
    e5 = board[4][4].display || "□"
    e6 = board[4][5].display || "■"
    e7 = board[4][6].display || "□"
    e8 = board[4][7].display || "■"
    f1 = board[5][0].display || "■"
    f2 = board[5][1].display || "□"
    f3 = board[5][2].display || "■"
    f4 = board[5][3].display || "□"
    f5 = board[5][4].display || "■"
    f6 = board[5][5].display || "□"
    f7 = board[5][6].display || "■"
    f8 = board[5][7].display || "□"
    g1 = board[6][0].display || "□"
    g2 = board[6][1].display || "■"
    g3 = board[6][2].display || "□"
    g4 = board[6][3].display || "■"
    g5 = board[6][4].display || "□"
    g6 = board[6][5].display || "■"
    g7 = board[6][6].display || "□"
    g8 = board[6][7].display || "■"
    h1 = board[7][0].display || "■"
    h2 = board[7][1].display || "□"
    h3 = board[7][2].display || "■"
    h4 = board[7][3].display || "□"
    h5 = board[7][4].display || "■"
    h6 = board[7][5].display || "□"
    h7 = board[7][6].display || "■"
    h8 = board[7][7].display || "□"

    board = <<~END

        A  B  C  D  E  F  G  H
      8[#{a8}][#{b8}][#{c8}][#{d8}][#{e8}][#{f8}][#{g8}][#{h8}]8
      7[#{a7}][#{b7}][#{c7}][#{d7}][#{e7}][#{f7}][#{g7}][#{h7}]7
      6[#{a6}][#{b6}][#{c6}][#{d6}][#{e6}][#{f6}][#{g6}][#{h6}]6
      5[#{a5}][#{b5}][#{c5}][#{d5}][#{e5}][#{f5}][#{g5}][#{h5}]5
      4[#{a4}][#{b4}][#{c4}][#{d4}][#{e4}][#{f4}][#{g4}][#{h4}]4
      3[#{a3}][#{b3}][#{c3}][#{d3}][#{e3}][#{f3}][#{g3}][#{h3}]3
      2[#{a2}][#{b2}][#{c2}][#{d2}][#{e2}][#{f2}][#{g2}][#{h2}]2
      1[#{a1}][#{b1}][#{c1}][#{d1}][#{e1}][#{f1}][#{g1}][#{h1}]1
        A  B  C  D  E  F  G  H

    END

    puts board
  end
end
