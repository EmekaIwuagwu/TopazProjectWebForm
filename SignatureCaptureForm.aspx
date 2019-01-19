<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignatureCaptureForm.aspx.cs" Inherits="SakalGBSignatureProcess.SignatureCaptureForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script type="text/javascript">
        function OnClear()
        {
            document.FORM1.SigPlus1.ClearTablet(); //Clears the signature, in case of error or mistake
        }

        function onSign()
        {
            document.FORM1.SigPlus1.TabletState = 1; 
        }

        function onSave()
        {
          /* if(document.FORM1.username.value == "")
            {
               alert("Please Username Before Continuing...");
               return false;
            }
            */
            if(document.FORM1.SigPlus1.NumberOfTabletPoints > 0)
            {
               document.FORM1.SigPlus1.TabletState = 0; //Turns tablet off
               document.FORM1.SigPlus1.AutoKeyStart();
   
               document.FORM1.SigPlus1.AutoKeyData = document.FORM1.username.value;
                //document.FORM1.SigPlus1.AutoKeyData = document.FORM1.holder.value;
               //pass here the data you want to use to encrypt the signature
               //this demo simply encrypts to the name typed in by the user
               //you'll probably want to make sure your encryption data you use is
               //more useful...that you encrypt the signature to the data important
               //to your app, and what the client has agreed to
   
               document.FORM1.SigPlus1.AutoKeyFinish();
               document.FORM1.SigPlus1.EncryptionMode = 2;
               document.FORM1.SigPlus1.SigCompressionMode = 1; 
   
                document.FORM1.hidden.value = document.FORM1.SigPlus1.SigString;
               //pass the signature ASCII hex string to the hidden field,
               //so it will be automatically passed when the page is submitted
   
               document.FORM1.submit();
            }
            else
            {
               alert("Please Sign Before Continuing...");
               return false;
            }


        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 20px;
        }
        .auto-style4 {
            left: 0px;
            width: 347px;
            top: 0px;
            height: 163px;
        }
        .auto-style5 {
            width: 227px;
        }
        .auto-style6 {
            width: 509px;
            text-align: right;
        }
        .auto-style7 {
            width: 90%;
        }
        .auto-style8 {
            width: 328px;
        }
        .auto-style9 {
            width: 348px;
        }
        </style>

</head>
<body>

    <form id="FORM1" name="FORM1" method="post" action="SignatureConfirmation.aspx" />
                        <input id="firstname" class="auto-style8" type="hidden" name="firstname" />
                        <input id="email" class="auto-style8" type="hidden" name="email" />
                        <input id="lastname" class="auto-style8" type="hidden" name="lastname" />
        <div>
            <table class="auto-style7">
                <tr>
                    <td class="auto-style6" style="font-family: 'Century Gothic'; font-size: medium; font-weight: normal; font-style: normal; color: #202020">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6" style="font-family: 'Century Gothic'; font-size: medium; font-weight: normal; font-style: normal; color: #202020">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        <INPUT id="username" type="hidden" name="username" class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style6" style="font-family: 'Century Gothic'; font-size: medium; font-weight: normal; font-style: normal; color: #202020">Signature Capture:</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td><OBJECT id="SigPlus1"
							classid="clsid:69A40DA3-4D42-11D0-86B0-0000C025864A" name="SigPlus1" class="auto-style4">
							<PARAM NAME="_Version" VALUE="131095">
							<PARAM NAME="_ExtentX" VALUE="9181">
							<PARAM NAME="_ExtentY" VALUE="4313">
							<PARAM NAME="_StockProps" VALUE="9">
						</OBJECT>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" style="font-family: 'Century Gothic'; font-size: medium; font-weight: normal; font-style: normal; color: #202020">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6" style="font-family: 'Century Gothic'; font-size: medium; font-weight: normal; font-style: normal; color: #202020">
                        <asp:Label ID="holder" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style5">
                                    <input id="SignBtn" type="button" value="Sign"  onclick="onSign();"/>&nbsp;
                                    <input id="ClearBtn" type="button" value="Clear" onclick="OnClear();" /></td>
                                <td>
                                    <input id="Button1" type="button" value="Save" onclick="onSave();" />
                                    <INPUT id="hidden" type="hidden" name="hidden">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        </form>
    </body>
</html>
