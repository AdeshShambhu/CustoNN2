"""
 Copyright (c) 2018 Intel Corporation

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
"""

import unittest

import numpy as np

from mo.front.common.partial_infer.elemental import copy_shape_infer
from mo.graph.graph import Node
from mo.utils.unittest.graph import build_graph

nodes_attributes = {'node_1': {'type': 'Identity', 'kind': 'op'},
                    'grn': {'type': 'GRN', 'kind': 'op'},
                    'node_3': {'type': 'Identity', 'kind': 'op'}}


class TestGRNOp(unittest.TestCase):
    def test_grn_infer(self):
        graph = build_graph(nodes_attributes,
                            [('node_1', 'grn'),
                             ('grn', 'node_3')],
                            {'node_3': {'is_output': True, 'shape': None},
                             'node_1': {'shape': np.array([1, 3, 227, 227])},
                             'grn': {'bias': 1}
                             })

        grn_node = Node(graph, 'grn')
        copy_shape_infer(grn_node)
        exp_shape = np.array([1, 3, 227, 227])
        res_shape = graph.node['node_3']['shape']
        for i in range(0, len(exp_shape)):
            self.assertEqual(exp_shape[i], res_shape[i])
