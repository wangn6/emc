//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Core.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProjectEnvironmentMap
    {
        public int MapId { get; set; }
        public int ProjectId { get; set; }
        public int EnvironmentId { get; set; }
    
        public virtual Project Project { get; set; }
        public virtual SupportedEnvironment SupportedEnvironment { get; set; }
    }
}
