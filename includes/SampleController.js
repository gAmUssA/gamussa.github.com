Ext.define('episode_3_pagination.controller.SampleController', {
	extend: 'Ext.app.Controller',
	stores: ['episode_3_pagination.store.dto.PersonStore'],
	refs: [{								//<1>
		ref: 'ThePanel',
		selector: 'samplegridpanel'
	}],

	init: function() {
		this.control({
			'samplegridpanel button[action=load]': {
				click: this.onLoad
			}
		});
	},

	onLoad: function() {
		// returns instance of PersonStore
		var store = this.getThePanel().getStore();		//<2>
		store.load();
	}
});