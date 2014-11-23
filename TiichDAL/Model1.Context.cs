﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TiichDAL
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class TiichEntities : DbContext
    {
        public TiichEntities()
            : base("name=TiichEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Tag> Tag { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<Workshop> Workshop { get; set; }
    
        public virtual ObjectResult<StraightSearch_Result> StraightSearch(string term, string option)
        {
            var termParameter = term != null ?
                new ObjectParameter("term", term) :
                new ObjectParameter("term", typeof(string));
    
            var optionParameter = option != null ?
                new ObjectParameter("option", option) :
                new ObjectParameter("option", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<StraightSearch_Result>("StraightSearch", termParameter, optionParameter);
        }
    }
}
