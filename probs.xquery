<HTML>
     <BODY>
          <TABLE BORDER="2">
              <TR>
                 <TH>Target Word</TH>
                 <TH>Succeeding Word </TH>
                 <TH>Probability of Occurrence</TH>
              </TR>
              {
               let $tw:= collection("./?select=*.xml")//w[lower-case(normalize-space()) = "has"],
                   $sw:= $tw/lower-case(normalize-space(following-sibling :: w[1]))
               for $distinctword in distinct-values($sw)
               let $numerator := count($sw[.=$distinctword]),
                   $denominator := count(collection("./?select=*.xml")//w[lower-case(normalize-space()) = $distinctword]),
                   $probability := $numerator div $denominator
               order by $probability descending 
               return
               <TR>
                   <TD>{$tw[1]}</TD>
                   <TD>{$distinctword}</TD>
                   <TD>{$probability}</TD>
               </TR>
               }
            </TABLE>
       </BODY>
 </HTML>
           
                   