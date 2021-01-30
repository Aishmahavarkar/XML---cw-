<HTML>
     <BODY>
         <TABLE BORDER ="2">
              <TR>
                 <TH>Target Word</TH>
                 <TH>Succeeding Word</TH>
                 <TH>Frequency of Occurrence</TH>
              </TR>
            
              {
               let $tw:= collection("./?select=*.xml")//w[lower-case(normalize-space()) = "has"],
                   $sw := $tw/lower-case(normalize-space(following-sibling::w[1]))
               for $distinctword in distinct-values ($sw)
               let $frequency := count($sw[.=$distinctword])
               order by $frequency descending
               return
               <TR>
                   <TD> {$tw[1]} </TD>
                   <TD> {$distinctword} </TD>
                   <TD> {$frequency} </TD>
               </TR>
               }   
         </TABLE>
     </BODY>
</HTML>