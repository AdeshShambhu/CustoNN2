"""
 Copyright (c) 2017-2018 Intel Corporation

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

from mo.back.replacement import BackReplacementPattern
from mo.front.common.replacement import FrontReplacementOp, FrontReplacementPattern, FrontReplacementSubgraph
from mo.front.extractor import FrontExtractorOp
from mo.front.tf.replacement import FrontReplacementFromConfigFileSubGraph, FrontReplacementFromConfigFileOp, \
    FrontReplacementFromConfigFileGeneral
from mo.middle.replacement import MiddleReplacementPattern
from mo.ops.op import Op
from mo.utils import class_registration


def update_registration():
    class_registration.update_registration([Op, FrontExtractorOp, FrontReplacementOp, FrontReplacementPattern,
                                            FrontReplacementSubgraph, FrontReplacementFromConfigFileSubGraph,
                                            FrontReplacementFromConfigFileOp, MiddleReplacementPattern,
                                            BackReplacementPattern, FrontReplacementFromConfigFileGeneral])
