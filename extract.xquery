declare variable $targetword as xs:string external;
<HTML>
     <BODY>
         <TABLE BORDER ="2">
              <TR>
                 <TH>Target Word</TH>
                 <TH>Succeeding Word</TH>
              </TR>
            
        {
   
         for $w  in collection ("./?select=*.xml")//s//w
         let $tw := normalize-space(lower-case($w)),
             $sw := normalize-space(lower-case($w/following-sibling::w[1]))

         where $tw = 'has'
         return 
               <TR>
                   <TD> {$tw} </TD>
                   <TD> {$sw}</TD>
               </TR>
      }
         </TABLE>
      </BODY>
</HTML>