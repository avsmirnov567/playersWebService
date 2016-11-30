using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace PlayerData
{
    [DataContract]
    public class Players
    {
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string Sports { get; set; }
        [DataMember]
        public string Country { get; set; }

        public Players(string name, string sport, string country)
        {
            Name = name;
            Sports = sport;
            Country = country;
        }
    }

    [ServiceContract]
    public interface IService1
    {
        [WebGet(UriTemplate = "/players",
                RequestFormat = WebMessageFormat.Json,
                ResponseFormat = WebMessageFormat.Json,
                BodyStyle = WebMessageBodyStyle.Bare)]
        List<Players> GetPlayers();

        [WebGet(UriTemplate = "/players?nameQuery={name}",
                RequestFormat = WebMessageFormat.Json,
                ResponseFormat = WebMessageFormat.Json,
                BodyStyle = WebMessageBodyStyle.Bare)]
        List<Players> GetPlayersByName(string name);

        [OperationContract]
        [WebInvoke(Method = @"POST",
            BodyStyle = WebMessageBodyStyle.Bare,
            RequestFormat = WebMessageFormat.Json,
            ResponseFormat = WebMessageFormat.Json,
            UriTemplate = "/addPlayer")]
        string InsertPlayer(Players player);
    }

}
