

function du($dir=".") { 
    get-childitem -Force $dir | 
      ForEach-Object { $f = $_ ; 
          get-childitem -Force -r $_.FullName | 
             measure-object -property length -sum |
               Select-Object @{Name="Name";Expression={$f}},Sum} | Sort-Object -Descending Sum
               
  }

# PowerShell Script to Display File Size
Function Format-DiskSize() {
    [cmdletbinding()]
    Param ([long]$Type)
    If ($Type -ge 1TB) {[string]::Format("{0:0.00} TB", $Type / 1TB)}
    ElseIf ($Type -ge 1GB) {[string]::Format("{0:0.00} GB", $Type / 1GB)}
    ElseIf ($Type -ge 1MB) {[string]::Format("{0:0.00} MB", $Type / 1MB)}
    ElseIf ($Type -ge 1KB) {[string]::Format("{0:0.00} KB", $Type / 1KB)}
    ElseIf ($Type -gt 0) {[string]::Format("{0:0.00} Bytes", $Type)}
    Else {""}
    } # End of function
    
    
    #$BigNumber = "320000"
    #Format-DiskSize $BigNumber

    $toto=du
   
    
    $dush=[System.Collections.ArrayList]@()

    class fajlik                                                     
{
    [string]$Name
    [string]$Size
  }

   ForEach($t in $toto) {


    $subor = [fajlik]@{
        Name = $t.Name.Name
        Size = Format-DiskSize $t.Sum
        
    }

    $dush=$dush+$subor
}

$dush