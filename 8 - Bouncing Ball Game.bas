
    nomainwin
    loadbmp "redball", "Ball.bmp"
    loadbmp "bg", "Background.bmp"
    WindowWidth = 552
    WindowHeight = 415
    UpperLeftX = (DisplayWidth - WindowWidth)/2
    UpperLeftY = (DisplayHeight - WindowHeight)/2 - 30
    button #1.button1, "Release The Ball", [Drop], UL, 26, 16, 138, 25
    button #1.button2, "Stop The Ball", [Stop], UL, 190, 16, 114, 25
    button #1.button3, "Reset", [Reset], UL, 350, 16, 50, 25
    open "Bounce That Ball" for graphics_nsb_nf as #1
    print #1, "fill white; flush"
    print #1, "font ms_sans_serif 0 16"
    print #1, "trapclose [quit]"
    print #1, "addsprite ball redball"
    y = 50
    print #1, "spritexy ball 50 "; y
    print #1, "background bg"
    print #1, "drawsprites"
    wait

[Drop]
    t = 0
    dy = 0
    hmax = y
    timer 50, [fall]
    [fall]
        t = t + 1
        dy = dy + t
        y = y + dy
        if y >= 300 then
            timer 0
            y = 300
            goto [Bounce]
        end if
        print #1, "spritexy ball 50 "; y
        print #1, "drawsprites"
        wait

[Bounce]
    timer 50, [rise]
    [rise]
        t = t - 1
        dy = dy - t
        y = y - dy
        if y <= hmax then
            y = hmax
            timer 0
            goto [Drop]
        end if
        print #1, "spritexy ball 50 "; y
        print #1, "drawsprites"
        wait

[Stop]
    timer 0
    wait

[Reset]
    timer 0
    y = 50
    print #1, "spritexy ball 50 50"
    print #1, "drawsprites"
    wait

[quit]
    close #1
    stop
