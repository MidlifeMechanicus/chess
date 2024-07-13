# Puts the current boardstate.

module ShowBoard
  def show_board
    a1 = board[0][0] || "□"
    a2 = board[0][1] || "■"
    a3 = board[0][2] || "□"
    a4 = board[0][3] || "■"
    a5 = board[0][4] || "□"
    a6 = board[0][5] || "■"
    a7 = board[0][6] || "□"
    a8 = board[0][7] || "■"
    b1 = board[1][0] || "■"
    b2 = board[1][1] || "□"
    b3 = board[1][2] || "■"
    b4 = board[1][3] || "□"
    b5 = board[1][4] || "■"
    b6 = board[1][5] || "□"
    b7 = board[1][6] || "■"
    b8 = board[1][7] || "□"
    c1 = board[2][0] || "□"
    c2 = board[2][1] || "■"
    c3 = board[2][2] || "□"
    c4 = board[2][3] || "■"
    c5 = board[2][4] || "□"
    c6 = board[2][5] || "■"
    c7 = board[2][6] || "□"
    c8 = board[2][7] || "■"
    d1 = board[3][0] || "■"
    d2 = board[3][1] || "□"
    d3 = board[3][2] || "■"
    d4 = board[3][3] || "□"
    d5 = board[3][4] || "■"
    d6 = board[3][5] || "□"
    d7 = board[3][6] || "■"
    d8 = board[3][7] || "□"
    e1 = board[4][0] || "□"
    e2 = board[4][1] || "■"
    e3 = board[4][2] || "□"
    e4 = board[4][3] || "■"
    e5 = board[4][4] || "□"
    e6 = board[4][5] || "■"
    e7 = board[4][6] || "□"
    e8 = board[4][7] || "■"
    f1 = board[5][0] || "■"
    f2 = board[5][1] || "□"
    f3 = board[5][2] || "■"
    f4 = board[5][3] || "□"
    f5 = board[5][4] || "■"
    f6 = board[5][5] || "□"
    f7 = board[5][6] || "■"
    f8 = board[5][7] || "□"
    g1 = board[6][0] || "□"
    g2 = board[6][1] || "■"
    g3 = board[6][2] || "□"
    g4 = board[6][3] || "■"
    g5 = board[6][4] || "□"
    g6 = board[6][5] || "■"
    g7 = board[6][6] || "□"
    g8 = board[6][7] || "■"
    h1 = board[7][0] || "■"
    h2 = board[7][1] || "□"
    h3 = board[7][2] || "■"
    h4 = board[7][3] || "□"
    h5 = board[7][4] || "■"
    h6 = board[7][5] || "□"
    h7 = board[7][6] || "■"
    h8 = board[7][7] || "□"

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
