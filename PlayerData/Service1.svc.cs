using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using PlayerData.Model;

namespace PlayerData
{
    // ПРИМЕЧАНИЕ. Команду "Переименовать" в меню "Рефакторинг" можно использовать для одновременного изменения имени класса "Service1" в коде, SVC-файле и файле конфигурации.
    // ПРИМЕЧАНИЕ. Чтобы запустить клиент проверки WCF для тестирования службы, выберите элементы Service1.svc или Service1.svc.cs в обозревателе решений и начните отладку.
    public class Service1 : IService1
    {
        public List<Players> GetPlayers()
        {
            PlayersContext ctx = new PlayersContext();

            List<Model.Players> players = ctx.Players.ToList();
            List<Players> res = new List<Players>();

            foreach (Model.Players pl in players)
            {
                Players player = new Players(pl.id, pl.name, pl.sport, pl.country);
                res.Add(player);
            }
            return res;
        }

        public List<Players> GetPlayersByName(string name)
        {
            List<Players> res = new List<Players>();
            using (PlayersContext db = new PlayersContext())
            {
                List<Model.Players> players = db.Players.Where(pl => pl.name.Contains(name)).ToList();
                foreach (Model.Players pl in players)
                {
                    Players player = new Players(pl.id, pl.name, pl.sport, pl.country);
                    res.Add(player);
                }
            }
            return res;
        }

        public void InsertPlayer(Players player)
        {
            using (PlayersContext db = new PlayersContext())
            {
                Model.Players dbPlayer = new Model.Players();
                dbPlayer.id = player.Id;
                dbPlayer.name = player.Name;
                dbPlayer.country = player.Country;
                dbPlayer.sport = player.Sports;
                db.Players.Add(dbPlayer);
                db.SaveChanges();
            }
        }
    }
}
