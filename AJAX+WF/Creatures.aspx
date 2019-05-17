<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Creatures.aspx.cs" Inherits="Creatures" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="styles/default.css" rel="stylesheet" type="text/css" />
    <link href="styles/creatures.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#MainContent_creatureRadioList input').on('change', function () {
                var creatureId = parseInt(this.value);
                $.ajax({
                    url: 'CreatureService.asmx/GetCreatureById',
                    data: { creatureId: creatureId },
                    method: 'post',
                    dataType: 'xml',
                    success: function (data) {
                        $('#soundDiv').text($(data).find('sound').text());
                        $('#soundDiv').attr("class", "visible speech-bubble speech-wrapper");
                        $('#MainContent_linkToGender').attr("class", "link-to-page visible");
                        $('#imageDiv').attr("src", "/images/" + $(data).find('image').text());
                    },
                    error: function (err) {
                        alert(err.toString());
                    }
                });
                return false;
            });
        });
    </script>
        
    <div id="creatureQuestion">What would you rather see?</div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" Mode="Conditional">

        <ContentTemplate>
            <asp:RadioButtonList 
                ID="creatureRadioList" 
                runat="server" 
                AutoPostBack="False">
                <asp:ListItem Value="1">Unicorn</asp:ListItem>
                <asp:ListItem Value="2">Sasquatch</asp:ListItem>
                <asp:ListItem Value="3">Alien</asp:ListItem>
            </asp:RadioButtonList>
        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger controlid="creatureRadioList" eventname="SelectedIndexChanged" />
        </Triggers>

    </asp:UpdatePanel>

    <div id="creatureDiv">
        <img id="imageDiv" src=""/>
        <div id="soundDiv" class="hidden"/>
    </div>

    <asp:LinkButton 
        class="link-to-page hidden" 
        ID="linkToGender"
        runat="server"
        href="Default.aspx">
        Gender
    </asp:LinkButton>

</asp:Content>
