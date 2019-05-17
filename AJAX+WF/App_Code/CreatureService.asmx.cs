using AJAX_WF;
using Newtonsoft.Json;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.Services;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]

public class CreatureService : System.Web.Services.WebService
{

    public CreatureService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public Creature GetCreatureById(int creatureId)
    {
        Creature creature = new Creature();
        
        string cs = ConfigurationManager.ConnectionStrings["Creatures"].ConnectionString;
        using (SqlConnection con = new SqlConnection(@"
                Data Source=turtle;
                Initial Catalog = Playground;
                Integrated Security=False;
                User ID=sa;
                Password=The leatherback is the largest species of sea turtle. Measuring 2–3 meters (6–9 ft) in length"
        ))
        {
            SqlCommand cmd = new SqlCommand("spGetCreatureById", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = "@id";
            parameter.Value = creatureId;

            cmd.Parameters.Add(parameter);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                creature.id = Convert.ToInt32(rdr["id"]);
                creature.name = rdr["name"].ToString();
                creature.sound = rdr["sound"].ToString();
                creature.image = rdr["image"].ToString();
            }
        }
        return creature;
    }

    //public string GetEmployees()
    //{
    //    DataTable dataTable = new DataTable();
    //    using (SqlConnection conn = new SqlConnection(@"
    //            Data Source=turtle;
    //            Initial Catalog = Playground;
    //            Integrated Security=False;
    //            User ID=sa;
    //            Password=The leatherback is the largest species of sea turtle. Measuring 2–3 meters (6–9 ft) in length"
    //    ))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("SELECT * FROM Employees", conn))
    //        {
    //            SqlDataAdapter da = new SqlDataAdapter(cmd);
    //            da.Fill(dataTable);
    //            return JsonConvert.SerializeObject(dataTable);

    //        }
    //    }
    //}

}
