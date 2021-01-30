
<HTML>
    <BODY>
        <TABLE BORDER="2">
            <TR>
              <TH>Target Word</TH>
              <TH>Succeeding Word</TH>
              <TH>Probability of Occurrence</TH>
            </TR>
            
            {
            let $tw := collection("./?select=*.xml")//s//w[lower-case(normalize-space()) = "has"],
                $sw := $tw/lower-case(normalize-space(following-sibling :: w[1])),
                $distinctword := distinct-values($sw),
                $probabilitylist :=
                            for $word at $i in $distinctword
                            let $numerator :=count($sw[.=$word]),
                                $den := count (collection("./?select=*.xml")//w[lower-case(normalize-space())= $word]),
                                $probability := $numerator div $den
                            order by $probability descending 
                            return $probability 
                 for $probability at $i in subsequence ($probabilitylist,1,20)
                 return 
                 <TR>
                    <TD> {$tw[1]} </TD>
                    <TD> {$distinctword[$i]} </TD>
                    <TD> {$probability} </TD>
                 </TR>
              }   
          </TABLE>                  
      </BODY>  
 </HTML>     
            