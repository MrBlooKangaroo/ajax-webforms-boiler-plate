<%@ Page Title="index" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="styles/default.css" rel="stylesheet" type="text/css" />
    <link href="styles/creatures.css" rel="stylesheet" type="text/css" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div ID="genderWrapper" tabindex="1">
                <asp:Image ID="stickPerson" runat="server" ImageUrl="~/images/QuestionMark.png" />
                <h1>What are you?</h1>
                <asp:DropDownList ID="ddLGender" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddLGender_SelectedIndexChanged">
                    <asp:ListItem>?</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </div>
            
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate >
            <div id="loadingDiv">
                <img src="images/NESSLogo.gif" id="loadingGif"/>
                <h3>loading...</h3>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

        <asp:LinkButton 
            CSSClass="link-to-page hidden" 
            ID="linkToCreatures"
            runat="server"
            href="Creatures.aspx">
            Creatures
        </asp:LinkButton>

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
