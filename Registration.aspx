﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Vatsal.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border: 1px solid #000000;
            background-color: #C0C0C0;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style3 {
            height: 29px;
        }
    </style>
    </head>
<body>
    <form id="regestration" runat="server">
        <div>
           
             <table align="center" class="auto-style1" style="width: 50%">
                <tr>
                    <td colspan="2" rowspan="1" style="text-align: center; font-size: xx-large;">Rgestration Form&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right; padding-right: 15px;">Name:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding-right: 15px;">Phone number:</td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right; padding-right: 15px;">Email:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding-right: 15px;">Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding-right: 15px;">Rewrite Parssword:</td>
                    <td>
                        <asp:TextBox ID="txtRepassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding-right: 15px;">Gender:</td>
                    <td style="float: left">
                        <asp:RadioButtonList ID="rblGender" runat="server" CellPadding="1" CellSpacing="1" RepeatDirection="Horizontal" TextAlign="Left">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding-right: 15px;">which Social Media do you use?</td>
                    <td style="text-align: left">
                        <asp:CheckBoxList ID="cblSocial" runat="server" RepeatDirection="Horizontal" TextAlign="Left">
                            <asp:ListItem>Insta</asp:ListItem>
                            <asp:ListItem>Facebook</asp:ListItem>
                            <asp:ListItem>Linked in</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding-right: 15px;">City:</td>
                    <td>
                        <asp:DropDownList ID="ddlCity" runat="server">
                            <asp:ListItem>-----select-----</asp:ListItem>
                            <asp:ListItem>surat</asp:ListItem>
                            <asp:ListItem>tapi</asp:ListItem>
                            <asp:ListItem>botad</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding-right: 15px;">Date of birth:</td>
                    <td>
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding-right: 15px;">Address:</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" Height="57px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding-right: 15px;">Image:</td>
                    <td>
                        <asp:FileUpload ID="fuImage" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding-right: 10px;">
                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" Width="69px" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2" style="text-align: center">
                        <asp:Label ID="lblDetails" runat="server" Text="Details" EnableViewState="true" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvDept" runat="server" AutoGenerateDeleteButton="True">
                        </asp:GridView>
                    </td>
                </tr>
            </table>
           
        </div>
        <p>
            dept:&nbsp;
            <asp:DropDownList ID="ddlDept" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged">
                <asp:ListItem>select</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            course: <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True">
            </asp:DropDownList>
        </p>
    </form>
</body>
</html>
