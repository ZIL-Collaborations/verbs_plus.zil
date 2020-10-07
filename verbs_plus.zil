"Verbs Plus"

;----------------------------------------------------------------------

<SYNTAX ASK OBJECT (FIND PERSONBIT) ABOUT OBJECT = V-ASK-ABOUT PRE-ASK>

<ROUTINE PRE-ASK ()
    <COND (<OR <PRSO? ,WINNER> <NOT <FSET? ,PRSO ,PERSONBIT>>>
           <SETG P-CONT 0>
           <TELL "Talking to ">
           <COND (<PRSO? ,WINNER> <TELL "yourself">)
                 (ELSE <TELL A ,PRSO>)>
           <TELL ", huh?" CR>)>>

<ROUTINE V-ASK-ABOUT ()
    <TELL CT ,PRSO " doesn't seem interested." CR>>

;----------------------------------------------------------------------

<SYNTAX PRESS OBJECT = V-PRESS>
<VERB-SYNONYM PRESS>

<ROUTINE V-PRESS ()
    <COND (<PRSO? ,WINNER> <TELL "You press, but nothing happens.  That's life!" CR>)
          (<FSET? ,PRSO ,PERSONBIT> <YOU-MASHER>)
          (ELSE <POINTLESS "Pressing... Nothing happens.">)>
    <RTRUE>>

;----------------------------------------------------------------------

<SYNTAX KICK OBJECT = V-KICK>
<SYNTAX HIT OBJECT = V-HIT>
<SYNTAX PUNCH OBJECT = V-PUNCH>
<SYNTAX BEAT OBJECT = V-BEAT>
<SYNTAX WHACK OBJECT = V-WHACK>
<SYNTAX USE OBJECT = V-USE>

<ROUTINE V-KICK ()
    <PERFORM ,V?ATTACK ,PRSO>
    <RTRUE>>

<ROUTINE V-HIT ()
    <PERFORM ,V?ATTACK ,PRSO>
    <RTRUE>>
	
<ROUTINE V-PUNCH ()
    <PERFORM ,V?ATTACK ,PRSO>
    <RTRUE>>

<ROUTINE V-BEAT ()
    <PERFORM ,V?ATTACK ,PRSO>
    <RTRUE>>

<ROUTINE V-WHACK ()
    <PERFORM ,V?ATTACK ,PRSO>
    <RTRUE>>
		   
<ROUTINE V-USE ()
    <TELL "You'll have to be a bit more explicit than that." CR>>


;----------------------------------------------------------------------

<SYNTAX EXIT OBJECT = V-EXIT>
<VERB-SYNONYM LEAVE>

<ROUTINE V-EXIT ()
    <COND (<FSET? ,PRSO ,DOORBIT>
           <DO-WALK <DOOR-DIR ,PRSO>>
           <RTRUE>)
          (ELSE
           <NOT-POSSIBLE "Sorry, no exit that way."> <RTRUE>)>>

;----------------------------------------------------------------------		
