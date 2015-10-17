/** doTimeOut **/
(function($) {'$:nomunge';
	var cache = {}, doTimeout = 'doTimeout', aps = Array.prototype.slice;

	$[doTimeout] = function() {
		return p_doTimeout.apply(window, [0].concat(aps.call(arguments)));
	};

	$.fn[doTimeout] = function() {
		var args = aps.call(arguments), result = p_doTimeout.apply(this, [doTimeout + args[0]].concat(args));
		return typeof args[0] === 'number' || typeof args[1] === 'number' ? this : result;
	};

	function p_doTimeout(jquery_data_key) {
		var that = this, elem, data = {}, method_base = jquery_data_key ? $.fn : $, args = arguments, slice_args = 4, id = args[1], delay = args[2], callback = args[3];
		if ( typeof id !== 'string') {
			slice_args--;
			id = jquery_data_key = 0;
			delay = args[1];
			callback = args[2];
		}
		if (jquery_data_key) {
			elem = that.eq(0);
			elem.data(jquery_data_key, data = elem.data(jquery_data_key) || {});
		} else if (id) {
			data = cache[id] || (cache[id] = {} );
		}
		data.id && clearTimeout(data.id);
		delete data.id;
		function cleanup() {
			if (jquery_data_key) {
				elem.removeData(jquery_data_key);
			} else if (id) {
				delete cache[id];
			}
		};
		function actually_setTimeout() {
			data.id = setTimeout(function() {
				data.fn();
			}, delay);
		};
		if (callback) {
			data.fn = function(no_polling_loop) {
				if ( typeof callback === 'string') {
					callback = method_base[callback];
				}
				callback.apply(that, aps.call(args, slice_args)) === true && !no_polling_loop ? actually_setTimeout() : cleanup();
			};
			actually_setTimeout();
		} else if (data.fn) {
			delay === undefined ? cleanup() : data.fn(delay === false);
			return true;
		} else {
			cleanup();
		}
	};
})(jQuery.noConflict());
(function(a, b, c, d) {
	var e = a(b);
	a.fn.lazyload = function(c) {
		function i() {
			var b = 0;
			f.each(function() {
				var c = a(this);
				if (h.skip_invisible && !c.is(":visible"))
					return;
				if (!a.abovethetop(this, h) && !a.leftofbegin(this, h))
					if (!a.belowthefold(this, h) && !a.rightoffold(this, h))
						c.trigger("appear"), b = 0;
					else if (++b > h.failure_limit)
						return !1
			})
		}

		var f = this, g, h = {
			threshold : 0,
			failure_limit : 0,
			event : "scroll",
			effect : "show",
			container : b,
			data_attribute : "original",
			skip_invisible : !0,
			appear : null,
			load : null
		};
		return c && (d !== c.failurelimit && (c.failure_limit = c.failurelimit,
		delete c.failurelimit), d !== c.effectspeed && (c.effect_speed = c.effectspeed,
		delete c.effectspeed), a.extend(h, c)), g = h.container === d || h.container === b ? e : a(h.container), 0 === h.event.indexOf("scroll") && g.bind(h.event, function(a) {
			return i()
		}), this.each(function() {
			var b = this, c = a(b);
			b.loaded = !1, c.one("appear", function() {
				if (!this.loaded) {
					if (h.appear) {
						var d = f.length;
						h.appear.call(b, d, h)
					}
					a("<img />").bind("load", function() {
						c.hide().attr("src",c.data(h.data_attribute))[h.effect](h.effect_speed), b.loaded = !0;
						var d = a.grep(f, function(a) {
							return !a.loaded
						});
						f = a(d);
						if (h.load) {
							var e = f.length;
							h.load.call(b, e, h)
						}
					}).attr("src", c.data(h.data_attribute))
				}
			}), 0 !== h.event.indexOf("scroll") && c.bind(h.event, function(a) {
				b.loaded || c.trigger("appear")
			})
		}), e.bind("resize", function(a) {
			i()
		}), /iphone|ipod|ipad.*os 5/gi.test(navigator.appVersion) && e.bind("pageshow", function(b) {
			b.originalEvent.persisted && f.each(function() {
				a(this).trigger("appear")
			})
		}), a(b).load(function() {
			i()
		}), this
	}, a.belowthefold = function(c, f) {
		var g;
		return f.container === d || f.container === b ? g = e.height() + e.scrollTop() : g = a(f.container).offset().top + a(f.container).height(), g <= a(c).offset().top - f.threshold
	}, a.rightoffold = function(c, f) {
		var g;
		return f.container === d || f.container === b ? g = e.width() + e.scrollLeft() : g = a(f.container).offset().left + a(f.container).width(), g <= a(c).offset().left - f.threshold
	}, a.abovethetop = function(c, f) {
		var g;
		return f.container === d || f.container === b ? g = e.scrollTop() : g = a(f.container).offset().top, g >= a(c).offset().top + f.threshold + a(c).height()
	}, a.leftofbegin = function(c, f) {
		var g;
		return f.container === d || f.container === b ? g = e.scrollLeft() : g = a(f.container).offset().left, g >= a(c).offset().left + f.threshold + a(c).width()
	}, a.inviewport = function(b, c) {
		return !a.rightoffold(b, c) && !a.leftofbegin(b, c) && !a.belowthefold(b, c) && !a.abovethetop(b, c)
	}, a.extend(a.expr[":"], {
		"below-the-fold" : function(b) {
			return a.belowthefold(b, {
				threshold : 0
			})
		},
		"above-the-top" : function(b) {
			return !a.belowthefold(b, {
				threshold : 0
			})
		},
		"right-of-screen" : function(b) {
			return a.rightoffold(b, {
				threshold : 0
			})
		},
		"left-of-screen" : function(b) {
			return !a.rightoffold(b, {
				threshold : 0
			})
		},
		"in-viewport" : function(b) {
			return a.inviewport(b, {
				threshold : 0
			})
		},
		"above-the-fold" : function(b) {
			return !a.belowthefold(b, {
				threshold : 0
			})
		},
		"right-of-fold" : function(b) {
			return a.rightoffold(b, {
				threshold : 0
			})
		},
		"left-of-fold" : function(b) {
			return !a.rightoffold(b, {
				threshold : 0
			})
		}
	})
})(jQuery, window, document);