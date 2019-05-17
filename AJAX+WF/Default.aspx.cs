using System;
using System.Web.UI;
using System.Threading;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ddLGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        Sleep();
        linkToCreatures.CssClass = "link-to-page visible";
        if (ddLGender.SelectedValue == "Male")
            stickPerson.ImageUrl = "~/images/MaleStick.jpg";
        else if (ddLGender.SelectedValue == "Female")
            stickPerson.ImageUrl = "~/images/FemaleStick.jpg";
        else
            stickPerson.ImageUrl = "~/images/QuestionMark.png";
    }

    protected static void Sleep ()
    {
        var random = new Random();
        Thread.Sleep(random.Next(3000));
    }
}